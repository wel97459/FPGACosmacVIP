package rtl

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

import TFT_Driver._
import MySpinalHardware._

object LCD_Pixie {
    def apply(cycles: BigInt) : LCD_Pixie = new LCD_Pixie(cycles)
    def apply(time: TimeNumber) : LCD_Pixie = new LCD_Pixie((time * ClockDomain.current.frequency.getValue).toBigInt())
}

class LCD_Pixie(val Delay: BigInt) extends Component 
{
    var io = new Bundle()
    {
        val startFrame = in Bool()
        val startLine = in Bool()

        val data = in Bits(8 bits)
        val dataClk = in Bool()
        val lcd = new Bundle {
            val sck = out Bool()
            val rst = out Bool()
            val dc = out Bool()
            val sdo = out Bool()
        }

        val test = out Bool()
    }

    var tft = new TFT_ILI9341(Delay)

    val data_clk = False
    val data = B"9'h000"

    tft.io.data := data
    tft.io.data_clk := data_clk

    io.lcd.rst := tft.io.SPI_RST
    io.lcd.dc := tft.io.SPI_DC
    io.lcd.sck := tft.io.SPI_SCL
    io.lcd.sdo := tft.io.SPI_SDA
    
    val byteCounter = Counter(1025)

    val source,sink = Stream(Bits(8 bits))

    val PixleFiFo = StreamFifo(
        dataType = Bits(8 bits),
        depth    = 1024
    )

    PixleFiFo.io.flush := False
    PixleFiFo.io.push << source
    PixleFiFo.io.pop  >> sink

    sink.ready := False
    source.valid := io.dataClk && !byteCounter.willOverflowIfInc
    source.payload := io.data

    when(io.dataClk && !byteCounter.willOverflowIfInc) {byteCounter.increment()}

    io.test := byteCounter.willOverflowIfInc

    val initParamsList = List(
        0x02A, 0x100, 0x11f, 0x101, 0x11E, //CASET
        0x02B, 0x100, 0x137, 0x100, 0x1B6, //RASET
        0x02C, //RAMWR
        0x1FF  //END
    )
    val ParamsRom = Mem(UInt(9 bits), initParamsList.map(U(_, 9 bits)))
    val ParamsPointer = new Counter(start = 0, end = initParamsList.length)
    val paramData = ParamsRom(ParamsPointer)

    val colorByte = Reg(Bool()) init(false)

    val ScreenX = Counter(start = 0, end = 255)
    val ScreenY = Counter(start = 0, end = 127)
    val ScreenDone = RegNext(ScreenX.willOverflowIfInc && ScreenY.willOverflowIfInc)
    val PixleMul = new Counter(start = 0, end = 3)
    val Pixle = new Counter(start = 0, end = 8)


    val pixels = Reg(Bits(8 bits)) init(0)
    val pixelsNext = pixels |<< 1
    val colorOut = B"16'h0000"


    when(pixels.msb)
    {
        colorOut := B"16'hFFFF"
    } otherwise {
        colorOut := B"16'h0000"
    }

    when(paramData === 0x1FF){
        when(colorByte){
            data := B"1" ## colorOut(7 downto 0)
        }otherwise{
            data := B"1" ## colorOut(15 downto 8)
        }
    }otherwise(data := paramData.asBits(8 downto 0))


    val fsm = new StateMachine {
        val Init: State = new State with EntryPoint {
            whenIsActive {
                data_clk := False
                goto(Wait)
            }
        }

        val Wait: State = new State {
            whenIsActive{
                when(tft.io.displayReady){
                    goto(Done)
                }
            }
        }

        val StartFrame: State = new State{
            whenIsActive {
                when(paramData === 0x1ff){
                    goto(SendData)
                    byteCounter.clear()
                    PixleFiFo.io.flush := True
                }otherwise{
                    data_clk := True;
                    goto(SendData)
                }
            }
        }

        val SendData: State = new State{
            whenIsActive {
                data_clk := False;
                when(!tft.io.fifo_full){
                    when(paramData =/= 0x1ff){
                        ParamsPointer.increment()
                        goto(StartFrame)
                    }elsewhen(Pixle =/= 0) {

                        goto(LoadColor)
                        
                        ScreenX.increment()

                        when(PixleMul =/= 0){ PixleMul.increment() }
                        
                        when (ScreenX.willOverflowIfInc && !colorByte) {
                            ScreenY.increment()
                        }
                        
                        when(Pixle =/= 0 && PixleMul === 0){
                            pixels := pixelsNext
                            Pixle.increment()
                            PixleMul.increment()
                        }
                    }elsewhen(sink.valid) {
                        //pixels := io.data
                        ScreenX.increment()
                        pixels := sink.payload
                        sink.ready := True
                        PixleMul.increment()
                        Pixle.increment()
                        goto(LoadColor)
                    }
                }
            }
        }

        val LoadColor: State = new State {
            whenIsActive {
                when(Pixle === 8 && PixleMul === 0){
                    Pixle.clear()
                }
                goto(LoadColorHi)
            }
        }

        val LoadColorHi: State = new State {
            onEntry{
                data_clk := True;
                colorByte := True
            }
            whenIsActive {
                data_clk := False;
                goto(LoadColorLo)
            }
        }

        val LoadColorLo: State = new State {
            onEntry{
                data_clk := True;
                colorByte := False
            }
            whenIsActive  {
                data_clk := False;
                when(ScreenDone){
                    goto(Finish)
                }otherwise{
                    goto(SendData)
                }
            }
        }

        val Finish: State = new State {
            whenIsActive {
                colorByte := False;
                goto(Done)
            }
        }

        val Done: State = new State {
            whenIsActive {
                data_clk := False;

                ScreenY.clear()
                ScreenX.clear()
                ParamsPointer.clear()
                PixleMul.clear()
                Pixle.clear()
                colorByte := False
                when(io.startFrame){
                    goto(StartFrame)
                }
            }
        }
    }
}

