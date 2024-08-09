// Generator : SpinalHDL v1.10.0    git head : 270018552577f3bb8e5339ee2583c9c22d324215
// Component : Top_ICE40
// Git hash  : 0a8dedcbadf236560cad9021a09fb48e45ad08bb

`timescale 1ns/1ps

module Top_ICE40 (
  input  wire          reset_,
  input  wire          clk_12Mhz,
  output wire          video,
  output wire          sync,
  output wire          led_red,
  input  wire [3:0]    keypad_col,
  output wire [3:0]    keypad_row,
  output wire          lcd_sck,
  output wire          lcd_rst,
  output wire          lcd_dc,
  output wire          lcd_sdo
);

  wire                PLL_RESETB;
  wire                PLL_BYPASS;
  wire                intOSC_CLKHFPU;
  wire                intOSC_CLKHFEN;
  wire                Core17_areaDiv_Cpu_io_Wait_n;
  wire                Core17_areaDiv_Cpu_io_DMA_In_n;
  wire       [3:0]    Core17_areaDiv_Cpu_io_EF_n;
  reg        [7:0]    Core17_areaDiv_Cpu_io_DataIn;
  wire                Core17_areaDiv_Pixie_io_Disp_On;
  wire                Core17_areaDiv_Pixie_io_Disp_Off;
  wire                Core17_areaDiv_Rom_io_ena;
  wire       [0:0]    Core17_areaDiv_Rom_io_wea;
  wire       [8:0]    Core17_areaDiv_Rom_io_addra;
  wire       [7:0]    Core17_areaDiv_Rom_io_dina;
  wire                Core17_areaDiv_Ram_io_ena;
  wire       [0:0]    Core17_areaDiv_Ram_io_wea;
  wire       [12:0]   Core17_areaDiv_Ram_io_addra;
  wire                Core17_areaDiv_keypad_io_LatchKey;
  wire       [3:0]    Core17_areaDiv_keypad_io_Key;
  wire                PLL_PLLOUTGLOBAL;
  wire                PLL_PLLOUTCORE;
  wire                intOSC_CLKHF;
  wire                Core17_areaDiv_Cpu_io_Q;
  wire       [1:0]    Core17_areaDiv_Cpu_io_SC;
  wire       [2:0]    Core17_areaDiv_Cpu_io_N;
  wire                Core17_areaDiv_Cpu_io_TPA;
  wire                Core17_areaDiv_Cpu_io_TPB;
  wire                Core17_areaDiv_Cpu_io_MRD;
  wire                Core17_areaDiv_Cpu_io_MWR;
  wire       [7:0]    Core17_areaDiv_Cpu_io_Addr;
  wire       [15:0]   Core17_areaDiv_Cpu_io_Addr16;
  wire       [7:0]    Core17_areaDiv_Cpu_io_DataOut;
  wire                Core17_areaDiv_Pixie_io_Clear;
  wire                Core17_areaDiv_Pixie_io_INT;
  wire                Core17_areaDiv_Pixie_io_DMAO;
  wire                Core17_areaDiv_Pixie_io_EFx;
  wire                Core17_areaDiv_Pixie_io_Video;
  wire                Core17_areaDiv_Pixie_io_CompSync_;
  wire                Core17_areaDiv_Pixie_io_Locked;
  wire                Core17_areaDiv_Pixie_io_VSync;
  wire                Core17_areaDiv_Pixie_io_HSync;
  wire       [7:0]    Core17_areaDiv_Rom_io_douta;
  wire       [7:0]    Core17_areaDiv_Ram_io_douta;
  wire                Core17_areaDiv_keypad_io_KeyOut;
  wire       [3:0]    Core17_areaDiv_keypad_io_KeypadRow;
  wire                lcd_lcd_startFrame_buffercc_io_dataOut;
  wire                lcd_lcd_startLine_buffercc_io_dataOut;
  wire                lcd_lcd_dataClk_buffercc_io_dataOut;
  wire                lcd_Core48_LCD_io_lcd_sck;
  wire                lcd_Core48_LCD_io_lcd_rst;
  wire                lcd_Core48_LCD_io_lcd_dc;
  wire                lcd_Core48_LCD_io_lcd_sdo;
  wire                lcd_Core48_LCD_io_test;
  wire       [4:0]    _zz_Core17_rstCounter_valueNext;
  wire       [0:0]    _zz_Core17_rstCounter_valueNext_1;
  wire       [9:0]    _zz_Core17_areaDiv_beeper_valueNext;
  wire       [0:0]    _zz_Core17_areaDiv_beeper_valueNext_1;
  wire                Core48_clk;
  wire                Core48_reset;
  wire                Core17_clk;
  wire                Core17_reset;
  reg                 Core17_reset_1;
  wire                Core17_rstCounter_willIncrement;
  wire                Core17_rstCounter_willClear;
  reg        [4:0]    Core17_rstCounter_valueNext;
  reg        [4:0]    Core17_rstCounter_value;
  wire                Core17_rstCounter_willOverflowIfInc;
  wire                Core17_rstCounter_willOverflow;
  reg        [3:0]    _zz_when_ClockDomain_l426;
  wire                when_ClockDomain_l426;
  reg                 when_ClockDomain_l426_regNext;
  wire                _zz_1;
  reg                 Core17_areaDiv_romBootLatch;
  wire                when_Top_ICE40_l113;
  wire                when_Top_ICE40_l116;
  wire                when_Top_ICE40_l120;
  wire                when_Top_ICE40_l122;
  wire                Core17_areaDiv_beeper_willIncrement;
  wire                Core17_areaDiv_beeper_willClear;
  reg        [9:0]    Core17_areaDiv_beeper_valueNext;
  reg        [9:0]    Core17_areaDiv_beeper_value;
  wire                Core17_areaDiv_beeper_willOverflowIfInc;
  wire                Core17_areaDiv_beeper_willOverflow;
  wire                lcd_lcd_startFrame;
  wire                lcd_lcd_startLine;
  wire                lcd_lcd_dataClk;
  wire                lcd_Core48_startFrame;
  wire                lcd_Core48_startLine;
  wire                lcd_Core48_dataClkB;
  reg                 lcd_Core48_dataClkB_regNext;
  wire                lcd_Core48_dataClk;
  reg                 lcd_Core48_dataClkD;
  reg        [7:0]    lcd_Core48_data;

  assign _zz_Core17_rstCounter_valueNext_1 = Core17_rstCounter_willIncrement;
  assign _zz_Core17_rstCounter_valueNext = {4'd0, _zz_Core17_rstCounter_valueNext_1};
  assign _zz_Core17_areaDiv_beeper_valueNext_1 = Core17_areaDiv_beeper_willIncrement;
  assign _zz_Core17_areaDiv_beeper_valueNext = {9'd0, _zz_Core17_areaDiv_beeper_valueNext_1};
  SB_PLL40_CORE #(
    .DIVR(4'b0000),
    .DIVF(7'h2e),
    .DIVQ(3'b101),
    .FILTER_RANGE(3'b001),
    .FEEDBACK_PATH("SIMPLE"),
    .DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
    .FDA_FEEDBACK(4'b0000),
    .DELAY_ADJUSTMENT_MODE_RELATIVE("FIXED"),
    .FDA_RELATIVE(4'b0000),
    .SHIFTREG_DIV_MODE(1'b0),
    .PLLOUT_SELECT("GENCLK"),
    .ENABLE_ICEGATE(1'b0)
  ) PLL (
    .RESETB       (PLL_RESETB      ), //i
    .BYPASS       (PLL_BYPASS      ), //i
    .PLLOUTGLOBAL (PLL_PLLOUTGLOBAL), //o
    .PLLOUTCORE   (PLL_PLLOUTCORE  ), //o
    .REFERENCECLK (clk_12Mhz       )  //i
  );
  SB_HFOSC intOSC (
    .CLKHFPU (intOSC_CLKHFPU), //i
    .CLKHFEN (intOSC_CLKHFEN), //i
    .CLKHF   (intOSC_CLKHF  )  //o
  );
  Spinal1802 Core17_areaDiv_Cpu (
    .io_Wait_n      (Core17_areaDiv_Cpu_io_Wait_n      ), //i
    .io_Clear_n     (Core17_areaDiv_Pixie_io_Clear     ), //i
    .io_DMA_In_n    (Core17_areaDiv_Cpu_io_DMA_In_n    ), //i
    .io_DMA_Out_n   (Core17_areaDiv_Pixie_io_DMAO      ), //i
    .io_Interrupt_n (Core17_areaDiv_Pixie_io_INT       ), //i
    .io_EF_n        (Core17_areaDiv_Cpu_io_EF_n[3:0]   ), //i
    .io_Q           (Core17_areaDiv_Cpu_io_Q           ), //o
    .io_SC          (Core17_areaDiv_Cpu_io_SC[1:0]     ), //o
    .io_N           (Core17_areaDiv_Cpu_io_N[2:0]      ), //o
    .io_TPA         (Core17_areaDiv_Cpu_io_TPA         ), //o
    .io_TPB         (Core17_areaDiv_Cpu_io_TPB         ), //o
    .io_MRD         (Core17_areaDiv_Cpu_io_MRD         ), //o
    .io_MWR         (Core17_areaDiv_Cpu_io_MWR         ), //o
    .io_Addr        (Core17_areaDiv_Cpu_io_Addr[7:0]   ), //o
    .io_Addr16      (Core17_areaDiv_Cpu_io_Addr16[15:0]), //o
    .io_DataIn      (Core17_areaDiv_Cpu_io_DataIn[7:0] ), //i
    .io_DataOut     (Core17_areaDiv_Cpu_io_DataOut[7:0]), //o
    .Core17_clk     (Core17_clk                        ), //i
    .Core17_reset   (Core17_reset                      ), //i
    ._zz_18         (_zz_1                             )  //i
  );
  Spinal1861 Core17_areaDiv_Pixie (
    .io_Reset_    (Core17_reset_1                    ), //i
    .io_Disp_On   (Core17_areaDiv_Pixie_io_Disp_On   ), //i
    .io_Disp_Off  (Core17_areaDiv_Pixie_io_Disp_Off  ), //i
    .io_TPA       (Core17_areaDiv_Cpu_io_TPA         ), //i
    .io_TPB       (Core17_areaDiv_Cpu_io_TPB         ), //i
    .io_SC        (Core17_areaDiv_Cpu_io_SC[1:0]     ), //i
    .io_DataIn    (Core17_areaDiv_Cpu_io_DataOut[7:0]), //i
    .io_Clear     (Core17_areaDiv_Pixie_io_Clear     ), //o
    .io_INT       (Core17_areaDiv_Pixie_io_INT       ), //o
    .io_DMAO      (Core17_areaDiv_Pixie_io_DMAO      ), //o
    .io_EFx       (Core17_areaDiv_Pixie_io_EFx       ), //o
    .io_Video     (Core17_areaDiv_Pixie_io_Video     ), //o
    .io_CompSync_ (Core17_areaDiv_Pixie_io_CompSync_ ), //o
    .io_Locked    (Core17_areaDiv_Pixie_io_Locked    ), //o
    .io_VSync     (Core17_areaDiv_Pixie_io_VSync     ), //o
    .io_HSync     (Core17_areaDiv_Pixie_io_HSync     ), //o
    .Core17_clk   (Core17_clk                        ), //i
    .Core17_reset (Core17_reset                      ), //i
    ._zz_1        (_zz_1                             )  //i
  );
  RamInit Core17_areaDiv_Rom (
    .io_ena       (Core17_areaDiv_Rom_io_ena       ), //i
    .io_wea       (Core17_areaDiv_Rom_io_wea       ), //i
    .io_addra     (Core17_areaDiv_Rom_io_addra[8:0]), //i
    .io_douta     (Core17_areaDiv_Rom_io_douta[7:0]), //o
    .io_dina      (Core17_areaDiv_Rom_io_dina[7:0] ), //i
    .Core17_clk   (Core17_clk                      ), //i
    .Core17_reset (Core17_reset                    ), //i
    ._zz_3        (_zz_1                           )  //i
  );
  RamInit_1 Core17_areaDiv_Ram (
    .io_ena       (Core17_areaDiv_Ram_io_ena         ), //i
    .io_wea       (Core17_areaDiv_Ram_io_wea         ), //i
    .io_addra     (Core17_areaDiv_Ram_io_addra[12:0] ), //i
    .io_douta     (Core17_areaDiv_Ram_io_douta[7:0]  ), //o
    .io_dina      (Core17_areaDiv_Cpu_io_DataOut[7:0]), //i
    .Core17_clk   (Core17_clk                        ), //i
    .Core17_reset (Core17_reset                      ), //i
    ._zz_3        (_zz_1                             )  //i
  );
  Keypad Core17_areaDiv_keypad (
    .io_LatchKey  (Core17_areaDiv_keypad_io_LatchKey      ), //i
    .io_Key       (Core17_areaDiv_keypad_io_Key[3:0]      ), //i
    .io_KeyOut    (Core17_areaDiv_keypad_io_KeyOut        ), //o
    .io_KeypadCol (keypad_col[3:0]                        ), //i
    .io_KeypadRow (Core17_areaDiv_keypad_io_KeypadRow[3:0]), //o
    .Core17_clk   (Core17_clk                             ), //i
    .Core17_reset (Core17_reset                           ), //i
    ._zz_1        (_zz_1                                  )  //i
  );
  BufferCC lcd_lcd_startFrame_buffercc (
    .io_dataIn    (lcd_lcd_startFrame                    ), //i
    .io_dataOut   (lcd_lcd_startFrame_buffercc_io_dataOut), //o
    .Core48_clk   (Core48_clk                            ), //i
    .Core48_reset (Core48_reset                          )  //i
  );
  BufferCC lcd_lcd_startLine_buffercc (
    .io_dataIn    (lcd_lcd_startLine                    ), //i
    .io_dataOut   (lcd_lcd_startLine_buffercc_io_dataOut), //o
    .Core48_clk   (Core48_clk                           ), //i
    .Core48_reset (Core48_reset                         )  //i
  );
  BufferCC lcd_lcd_dataClk_buffercc (
    .io_dataIn    (lcd_lcd_dataClk                    ), //i
    .io_dataOut   (lcd_lcd_dataClk_buffercc_io_dataOut), //o
    .Core48_clk   (Core48_clk                         ), //i
    .Core48_reset (Core48_reset                       )  //i
  );
  LCD_Pixie lcd_Core48_LCD (
    .io_startFrame (lcd_Core48_startFrame    ), //i
    .io_startLine  (lcd_Core48_startLine     ), //i
    .io_data       (lcd_Core48_data[7:0]     ), //i
    .io_dataClk    (lcd_Core48_dataClkD      ), //i
    .io_lcd_sck    (lcd_Core48_LCD_io_lcd_sck), //o
    .io_lcd_rst    (lcd_Core48_LCD_io_lcd_rst), //o
    .io_lcd_dc     (lcd_Core48_LCD_io_lcd_dc ), //o
    .io_lcd_sdo    (lcd_Core48_LCD_io_lcd_sdo), //o
    .io_test       (lcd_Core48_LCD_io_test   ), //o
    .Core48_clk    (Core48_clk               ), //i
    .Core48_reset  (Core48_reset             )  //i
  );
  assign PLL_BYPASS = 1'b0;
  assign PLL_RESETB = 1'b1;
  assign intOSC_CLKHFEN = 1'b1;
  assign intOSC_CLKHFPU = 1'b1;
  assign Core17_clk = PLL_PLLOUTGLOBAL;
  assign Core17_reset = (! reset_);
  assign Core48_clk = intOSC_CLKHF;
  assign Core48_reset = (! reset_);
  assign Core17_rstCounter_willClear = 1'b0;
  assign Core17_rstCounter_willOverflowIfInc = (Core17_rstCounter_value == 5'h18);
  assign Core17_rstCounter_willOverflow = (Core17_rstCounter_willOverflowIfInc && Core17_rstCounter_willIncrement);
  always @(*) begin
    if(Core17_rstCounter_willOverflow) begin
      Core17_rstCounter_valueNext = 5'h00;
    end else begin
      Core17_rstCounter_valueNext = (Core17_rstCounter_value + _zz_Core17_rstCounter_valueNext);
    end
    if(Core17_rstCounter_willClear) begin
      Core17_rstCounter_valueNext = 5'h00;
    end
  end

  assign Core17_rstCounter_willIncrement = 1'b1;
  assign when_ClockDomain_l426 = (_zz_when_ClockDomain_l426 == 4'b1001);
  assign _zz_1 = (when_ClockDomain_l426_regNext || Core17_reset);
  assign Core17_areaDiv_Cpu_io_Wait_n = 1'b1;
  assign Core17_areaDiv_Cpu_io_DMA_In_n = 1'b1;
  assign Core17_areaDiv_Pixie_io_Disp_On = (((Core17_areaDiv_Cpu_io_N == 3'b001) && Core17_areaDiv_Cpu_io_TPB) && (! Core17_areaDiv_Cpu_io_MWR));
  assign Core17_areaDiv_Pixie_io_Disp_Off = (((Core17_areaDiv_Cpu_io_N == 3'b001) && Core17_areaDiv_Cpu_io_TPB) && (! Core17_areaDiv_Cpu_io_MRD));
  assign Core17_areaDiv_Rom_io_ena = 1'b1;
  assign Core17_areaDiv_Rom_io_wea = 1'b0;
  assign Core17_areaDiv_Rom_io_dina = 8'h00;
  assign Core17_areaDiv_Rom_io_addra = Core17_areaDiv_Cpu_io_Addr16[8 : 0];
  assign Core17_areaDiv_Ram_io_ena = 1'b1;
  assign Core17_areaDiv_Ram_io_wea = (! Core17_areaDiv_Cpu_io_MWR);
  assign Core17_areaDiv_Ram_io_addra = Core17_areaDiv_Cpu_io_Addr16[12 : 0];
  assign when_Top_ICE40_l113 = (! Core17_areaDiv_Pixie_io_Clear);
  assign when_Top_ICE40_l116 = (Core17_areaDiv_Cpu_io_N == 3'b100);
  assign when_Top_ICE40_l120 = ((! Core17_areaDiv_romBootLatch) || ((16'h8000 <= Core17_areaDiv_Cpu_io_Addr16) && (Core17_areaDiv_Cpu_io_Addr16 <= 16'h81ff)));
  always @(*) begin
    if(when_Top_ICE40_l120) begin
      Core17_areaDiv_Cpu_io_DataIn = Core17_areaDiv_Rom_io_douta;
    end else begin
      if(when_Top_ICE40_l122) begin
        Core17_areaDiv_Cpu_io_DataIn = Core17_areaDiv_Ram_io_douta;
      end else begin
        Core17_areaDiv_Cpu_io_DataIn = 8'h00;
      end
    end
  end

  assign when_Top_ICE40_l122 = (Core17_areaDiv_Cpu_io_Addr16 < 16'h2000);
  assign Core17_areaDiv_keypad_io_LatchKey = (((Core17_areaDiv_Cpu_io_N == 3'b010) && Core17_areaDiv_Cpu_io_TPB) && (! Core17_areaDiv_Cpu_io_MRD));
  assign Core17_areaDiv_keypad_io_Key = Core17_areaDiv_Cpu_io_DataOut[3 : 0];
  assign keypad_row = (~ Core17_areaDiv_keypad_io_KeypadRow);
  assign Core17_areaDiv_Cpu_io_EF_n = {1'b1,{Core17_areaDiv_keypad_io_KeyOut,{1'b1,Core17_areaDiv_Pixie_io_EFx}}};
  assign Core17_areaDiv_beeper_willClear = 1'b0;
  assign Core17_areaDiv_beeper_willOverflowIfInc = (Core17_areaDiv_beeper_value == 10'h3e7);
  assign Core17_areaDiv_beeper_willOverflow = (Core17_areaDiv_beeper_willOverflowIfInc && Core17_areaDiv_beeper_willIncrement);
  always @(*) begin
    if(Core17_areaDiv_beeper_willOverflow) begin
      Core17_areaDiv_beeper_valueNext = 10'h000;
    end else begin
      Core17_areaDiv_beeper_valueNext = (Core17_areaDiv_beeper_value + _zz_Core17_areaDiv_beeper_valueNext);
    end
    if(Core17_areaDiv_beeper_willClear) begin
      Core17_areaDiv_beeper_valueNext = 10'h000;
    end
  end

  assign Core17_areaDiv_beeper_willIncrement = 1'b1;
  assign sync = Core17_areaDiv_Pixie_io_CompSync_;
  assign video = Core17_areaDiv_Pixie_io_Video;
  assign led_red = (! (Core17_areaDiv_Cpu_io_Q && (Core17_areaDiv_beeper_value < 10'h032)));
  assign lcd_lcd_startFrame = (! Core17_areaDiv_Pixie_io_INT);
  assign lcd_lcd_startLine = (! Core17_areaDiv_Pixie_io_DMAO);
  assign lcd_lcd_dataClk = (Core17_areaDiv_Cpu_io_TPB && (Core17_areaDiv_Cpu_io_SC == 2'b10));
  assign lcd_Core48_startFrame = lcd_lcd_startFrame_buffercc_io_dataOut;
  assign lcd_Core48_startLine = lcd_lcd_startLine_buffercc_io_dataOut;
  assign lcd_Core48_dataClkB = lcd_lcd_dataClk_buffercc_io_dataOut;
  assign lcd_Core48_dataClk = (lcd_Core48_dataClkB && (! lcd_Core48_dataClkB_regNext));
  assign lcd_sck = lcd_Core48_LCD_io_lcd_sck;
  assign lcd_rst = lcd_Core48_LCD_io_lcd_rst;
  assign lcd_dc = lcd_Core48_LCD_io_lcd_dc;
  assign lcd_sdo = lcd_Core48_LCD_io_lcd_sdo;
  always @(posedge Core17_clk) begin
    if(Core17_reset) begin
      Core17_reset_1 <= 1'b0;
      Core17_rstCounter_value <= 5'h00;
      _zz_when_ClockDomain_l426 <= 4'b0000;
      when_ClockDomain_l426_regNext <= 1'b0;
    end else begin
      Core17_rstCounter_value <= Core17_rstCounter_valueNext;
      if(Core17_rstCounter_willOverflow) begin
        Core17_reset_1 <= 1'b1;
      end
      _zz_when_ClockDomain_l426 <= (_zz_when_ClockDomain_l426 + 4'b0001);
      if(when_ClockDomain_l426) begin
        _zz_when_ClockDomain_l426 <= 4'b0000;
      end
      when_ClockDomain_l426_regNext <= when_ClockDomain_l426;
    end
  end

  always @(posedge Core17_clk) begin
    if(_zz_1) begin
      if(Core17_reset) begin
      Core17_areaDiv_romBootLatch <= 1'b0;
      Core17_areaDiv_beeper_value <= 10'h000;
      end else begin
        if(when_Top_ICE40_l113) begin
          Core17_areaDiv_romBootLatch <= 1'b0;
        end else begin
          if(when_Top_ICE40_l116) begin
            Core17_areaDiv_romBootLatch <= 1'b1;
          end
        end
        Core17_areaDiv_beeper_value <= Core17_areaDiv_beeper_valueNext;
      end
    end
  end

  always @(posedge Core48_clk) begin
    lcd_Core48_dataClkB_regNext <= lcd_Core48_dataClkB;
    lcd_Core48_dataClkD <= lcd_Core48_dataClk;
  end

  always @(posedge Core48_clk) begin
    if(Core48_reset) begin
      lcd_Core48_data <= 8'h00;
    end else begin
      if(lcd_Core48_dataClk) begin
        lcd_Core48_data <= Core17_areaDiv_Cpu_io_DataOut;
      end
    end
  end


endmodule

module LCD_Pixie (
  input  wire          io_startFrame,
  input  wire          io_startLine,
  input  wire [7:0]    io_data,
  input  wire          io_dataClk,
  output wire          io_lcd_sck,
  output wire          io_lcd_rst,
  output wire          io_lcd_dc,
  output wire          io_lcd_sdo,
  output wire          io_test,
  input  wire          Core48_clk,
  input  wire          Core48_reset
);
  localparam fsm_enumDef_BOOT = 4'd0;
  localparam fsm_enumDef_Init = 4'd1;
  localparam fsm_enumDef_Wait_1 = 4'd2;
  localparam fsm_enumDef_StartFrame = 4'd3;
  localparam fsm_enumDef_SendData = 4'd4;
  localparam fsm_enumDef_LoadColor = 4'd5;
  localparam fsm_enumDef_LoadColorHi = 4'd6;
  localparam fsm_enumDef_LoadColorLo = 4'd7;
  localparam fsm_enumDef_Finish = 4'd8;
  localparam fsm_enumDef_Done = 4'd9;

  reg                 PixleFiFo_io_flush;
  wire       [8:0]    _zz_ParamsRom_port0;
  wire                tft_io_ready;
  wire                tft_io_sending;
  wire                tft_io_fifo_full;
  wire                tft_io_displayReady;
  wire                tft_io_SPI_SCL;
  wire                tft_io_SPI_SDA;
  wire                tft_io_SPI_DC;
  wire                tft_io_SPI_RST;
  wire                tft_io_SPI_CS;
  wire                PixleFiFo_io_push_ready;
  wire                PixleFiFo_io_pop_valid;
  wire       [7:0]    PixleFiFo_io_pop_payload;
  wire       [10:0]   PixleFiFo_io_occupancy;
  wire       [10:0]   PixleFiFo_io_availability;
  wire       [10:0]   _zz_byteCounter_valueNext;
  wire       [0:0]    _zz_byteCounter_valueNext_1;
  wire       [3:0]    _zz_ParamsPointer_valueNext;
  wire       [0:0]    _zz_ParamsPointer_valueNext_1;
  wire       [7:0]    _zz_ScreenX_valueNext;
  wire       [0:0]    _zz_ScreenX_valueNext_1;
  wire       [6:0]    _zz_ScreenY_valueNext;
  wire       [0:0]    _zz_ScreenY_valueNext_1;
  wire       [1:0]    _zz_PixleMul_valueNext;
  wire       [0:0]    _zz_PixleMul_valueNext_1;
  wire       [3:0]    _zz_Pixle_valueNext;
  wire       [0:0]    _zz_Pixle_valueNext_1;
  wire       [8:0]    _zz_data;
  reg                 data_clk;
  reg        [8:0]    data;
  reg                 byteCounter_willIncrement;
  reg                 byteCounter_willClear;
  reg        [10:0]   byteCounter_valueNext;
  reg        [10:0]   byteCounter_value;
  wire                byteCounter_willOverflowIfInc;
  wire                byteCounter_willOverflow;
  wire                source_valid;
  wire                source_ready;
  wire       [7:0]    source_payload;
  wire                sink_valid;
  reg                 sink_ready;
  wire       [7:0]    sink_payload;
  wire                when_LCD_Pixie_l64;
  reg                 ParamsPointer_willIncrement;
  reg                 ParamsPointer_willClear;
  reg        [3:0]    ParamsPointer_valueNext;
  reg        [3:0]    ParamsPointer_value;
  wire                ParamsPointer_willOverflowIfInc;
  wire                ParamsPointer_willOverflow;
  wire       [8:0]    paramData;
  reg                 colorByte;
  reg                 ScreenX_willIncrement;
  reg                 ScreenX_willClear;
  reg        [7:0]    ScreenX_valueNext;
  reg        [7:0]    ScreenX_value;
  wire                ScreenX_willOverflowIfInc;
  wire                ScreenX_willOverflow;
  reg                 ScreenY_willIncrement;
  reg                 ScreenY_willClear;
  reg        [6:0]    ScreenY_valueNext;
  reg        [6:0]    ScreenY_value;
  wire                ScreenY_willOverflowIfInc;
  wire                ScreenY_willOverflow;
  reg                 ScreenDone;
  reg                 PixleMul_willIncrement;
  reg                 PixleMul_willClear;
  reg        [1:0]    PixleMul_valueNext;
  reg        [1:0]    PixleMul_value;
  wire                PixleMul_willOverflowIfInc;
  wire                PixleMul_willOverflow;
  reg                 Pixle_willIncrement;
  reg                 Pixle_willClear;
  reg        [3:0]    Pixle_valueNext;
  reg        [3:0]    Pixle_value;
  wire                Pixle_willOverflowIfInc;
  wire                Pixle_willOverflow;
  reg        [7:0]    pixels;
  wire       [7:0]    pixelsNext;
  reg        [15:0]   colorOut;
  wire                when_LCD_Pixie_l93;
  wire                when_LCD_Pixie_l99;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  wire                when_LCD_Pixie_l126;
  wire                when_LCD_Pixie_l140;
  wire                when_LCD_Pixie_l141;
  wire                when_LCD_Pixie_l150;
  wire                when_LCD_Pixie_l152;
  wire                when_LCD_Pixie_l156;
  wire                when_LCD_Pixie_l144;
  wire                when_LCD_Pixie_l176;
  wire                when_StateMachine_l253;
  wire                when_StateMachine_l253_1;
  `ifndef SYNTHESIS
  reg [87:0] fsm_stateReg_string;
  reg [87:0] fsm_stateNext_string;
  `endif

  reg [8:0] ParamsRom [0:11];

  assign _zz_byteCounter_valueNext_1 = byteCounter_willIncrement;
  assign _zz_byteCounter_valueNext = {10'd0, _zz_byteCounter_valueNext_1};
  assign _zz_ParamsPointer_valueNext_1 = ParamsPointer_willIncrement;
  assign _zz_ParamsPointer_valueNext = {3'd0, _zz_ParamsPointer_valueNext_1};
  assign _zz_ScreenX_valueNext_1 = ScreenX_willIncrement;
  assign _zz_ScreenX_valueNext = {7'd0, _zz_ScreenX_valueNext_1};
  assign _zz_ScreenY_valueNext_1 = ScreenY_willIncrement;
  assign _zz_ScreenY_valueNext = {6'd0, _zz_ScreenY_valueNext_1};
  assign _zz_PixleMul_valueNext_1 = PixleMul_willIncrement;
  assign _zz_PixleMul_valueNext = {1'd0, _zz_PixleMul_valueNext_1};
  assign _zz_Pixle_valueNext_1 = Pixle_willIncrement;
  assign _zz_Pixle_valueNext = {3'd0, _zz_Pixle_valueNext_1};
  assign _zz_data = paramData;
  initial begin
    $readmemb("Top_ICE40.v_toplevel_lcd_Core48_LCD_ParamsRom.bin",ParamsRom);
  end
  assign _zz_ParamsRom_port0 = ParamsRom[ParamsPointer_value];
  TFT_ILI9341 tft (
    .io_data         (data[8:0]          ), //i
    .io_data_clk     (data_clk           ), //i
    .io_ready        (tft_io_ready       ), //o
    .io_sending      (tft_io_sending     ), //o
    .io_fifo_full    (tft_io_fifo_full   ), //o
    .io_displayReady (tft_io_displayReady), //o
    .io_SPI_SCL      (tft_io_SPI_SCL     ), //o
    .io_SPI_SDA      (tft_io_SPI_SDA     ), //o
    .io_SPI_DC       (tft_io_SPI_DC      ), //o
    .io_SPI_RST      (tft_io_SPI_RST     ), //o
    .io_SPI_CS       (tft_io_SPI_CS      ), //o
    .Core48_clk      (Core48_clk         ), //i
    .Core48_reset    (Core48_reset       )  //i
  );
  StreamFifo PixleFiFo (
    .io_push_valid   (source_valid                   ), //i
    .io_push_ready   (PixleFiFo_io_push_ready        ), //o
    .io_push_payload (source_payload[7:0]            ), //i
    .io_pop_valid    (PixleFiFo_io_pop_valid         ), //o
    .io_pop_ready    (sink_ready                     ), //i
    .io_pop_payload  (PixleFiFo_io_pop_payload[7:0]  ), //o
    .io_flush        (PixleFiFo_io_flush             ), //i
    .io_occupancy    (PixleFiFo_io_occupancy[10:0]   ), //o
    .io_availability (PixleFiFo_io_availability[10:0]), //o
    .Core48_clk      (Core48_clk                     ), //i
    .Core48_reset    (Core48_reset                   )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT       ";
      fsm_enumDef_Init : fsm_stateReg_string = "Init       ";
      fsm_enumDef_Wait_1 : fsm_stateReg_string = "Wait_1     ";
      fsm_enumDef_StartFrame : fsm_stateReg_string = "StartFrame ";
      fsm_enumDef_SendData : fsm_stateReg_string = "SendData   ";
      fsm_enumDef_LoadColor : fsm_stateReg_string = "LoadColor  ";
      fsm_enumDef_LoadColorHi : fsm_stateReg_string = "LoadColorHi";
      fsm_enumDef_LoadColorLo : fsm_stateReg_string = "LoadColorLo";
      fsm_enumDef_Finish : fsm_stateReg_string = "Finish     ";
      fsm_enumDef_Done : fsm_stateReg_string = "Done       ";
      default : fsm_stateReg_string = "???????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT       ";
      fsm_enumDef_Init : fsm_stateNext_string = "Init       ";
      fsm_enumDef_Wait_1 : fsm_stateNext_string = "Wait_1     ";
      fsm_enumDef_StartFrame : fsm_stateNext_string = "StartFrame ";
      fsm_enumDef_SendData : fsm_stateNext_string = "SendData   ";
      fsm_enumDef_LoadColor : fsm_stateNext_string = "LoadColor  ";
      fsm_enumDef_LoadColorHi : fsm_stateNext_string = "LoadColorHi";
      fsm_enumDef_LoadColorLo : fsm_stateNext_string = "LoadColorLo";
      fsm_enumDef_Finish : fsm_stateNext_string = "Finish     ";
      fsm_enumDef_Done : fsm_stateNext_string = "Done       ";
      default : fsm_stateNext_string = "???????????";
    endcase
  end
  `endif

  always @(*) begin
    data_clk = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
        data_clk = 1'b0;
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
        if(!when_LCD_Pixie_l126) begin
          data_clk = 1'b1;
        end
      end
      fsm_enumDef_SendData : begin
        data_clk = 1'b0;
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
        data_clk = 1'b0;
      end
      fsm_enumDef_LoadColorLo : begin
        data_clk = 1'b0;
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
        data_clk = 1'b0;
      end
      default : begin
      end
    endcase
    if(when_StateMachine_l253) begin
      data_clk = 1'b1;
    end
    if(when_StateMachine_l253_1) begin
      data_clk = 1'b1;
    end
  end

  always @(*) begin
    data = 9'h000;
    if(when_LCD_Pixie_l99) begin
      if(colorByte) begin
        data = {1'b1,colorOut[7 : 0]};
      end else begin
        data = {1'b1,colorOut[15 : 8]};
      end
    end else begin
      data = _zz_data[8 : 0];
    end
  end

  assign io_lcd_rst = tft_io_SPI_RST;
  assign io_lcd_dc = tft_io_SPI_DC;
  assign io_lcd_sck = tft_io_SPI_SCL;
  assign io_lcd_sdo = tft_io_SPI_SDA;
  always @(*) begin
    byteCounter_willIncrement = 1'b0;
    if(when_LCD_Pixie_l64) begin
      byteCounter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    byteCounter_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
        if(when_LCD_Pixie_l126) begin
          byteCounter_willClear = 1'b1;
        end
      end
      fsm_enumDef_SendData : begin
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
      end
      default : begin
      end
    endcase
  end

  assign byteCounter_willOverflowIfInc = (byteCounter_value == 11'h400);
  assign byteCounter_willOverflow = (byteCounter_willOverflowIfInc && byteCounter_willIncrement);
  always @(*) begin
    if(byteCounter_willOverflow) begin
      byteCounter_valueNext = 11'h000;
    end else begin
      byteCounter_valueNext = (byteCounter_value + _zz_byteCounter_valueNext);
    end
    if(byteCounter_willClear) begin
      byteCounter_valueNext = 11'h000;
    end
  end

  always @(*) begin
    PixleFiFo_io_flush = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
        if(when_LCD_Pixie_l126) begin
          PixleFiFo_io_flush = 1'b1;
        end
      end
      fsm_enumDef_SendData : begin
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
      end
      default : begin
      end
    endcase
  end

  assign source_ready = PixleFiFo_io_push_ready;
  assign sink_valid = PixleFiFo_io_pop_valid;
  assign sink_payload = PixleFiFo_io_pop_payload;
  always @(*) begin
    sink_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
      end
      fsm_enumDef_SendData : begin
        if(when_LCD_Pixie_l140) begin
          if(!when_LCD_Pixie_l141) begin
            if(!when_LCD_Pixie_l144) begin
              if(sink_valid) begin
                sink_ready = 1'b1;
              end
            end
          end
        end
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
      end
      default : begin
      end
    endcase
  end

  assign source_valid = (io_dataClk && (! byteCounter_willOverflowIfInc));
  assign source_payload = io_data;
  assign when_LCD_Pixie_l64 = (io_dataClk && (! byteCounter_willOverflowIfInc));
  assign io_test = byteCounter_willOverflowIfInc;
  always @(*) begin
    ParamsPointer_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
      end
      fsm_enumDef_SendData : begin
        if(when_LCD_Pixie_l140) begin
          if(when_LCD_Pixie_l141) begin
            ParamsPointer_willIncrement = 1'b1;
          end
        end
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    ParamsPointer_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
      end
      fsm_enumDef_SendData : begin
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
        ParamsPointer_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign ParamsPointer_willOverflowIfInc = (ParamsPointer_value == 4'b1100);
  assign ParamsPointer_willOverflow = (ParamsPointer_willOverflowIfInc && ParamsPointer_willIncrement);
  always @(*) begin
    if(ParamsPointer_willOverflow) begin
      ParamsPointer_valueNext = 4'b0000;
    end else begin
      ParamsPointer_valueNext = (ParamsPointer_value + _zz_ParamsPointer_valueNext);
    end
    if(ParamsPointer_willClear) begin
      ParamsPointer_valueNext = 4'b0000;
    end
  end

  assign paramData = _zz_ParamsRom_port0;
  always @(*) begin
    ScreenX_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
      end
      fsm_enumDef_SendData : begin
        if(when_LCD_Pixie_l140) begin
          if(!when_LCD_Pixie_l141) begin
            if(when_LCD_Pixie_l144) begin
              ScreenX_willIncrement = 1'b1;
            end else begin
              if(sink_valid) begin
                ScreenX_willIncrement = 1'b1;
              end
            end
          end
        end
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    ScreenX_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
      end
      fsm_enumDef_SendData : begin
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
        ScreenX_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign ScreenX_willOverflowIfInc = (ScreenX_value == 8'hff);
  assign ScreenX_willOverflow = (ScreenX_willOverflowIfInc && ScreenX_willIncrement);
  always @(*) begin
    ScreenX_valueNext = (ScreenX_value + _zz_ScreenX_valueNext);
    if(ScreenX_willClear) begin
      ScreenX_valueNext = 8'h00;
    end
  end

  always @(*) begin
    ScreenY_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
      end
      fsm_enumDef_SendData : begin
        if(when_LCD_Pixie_l140) begin
          if(!when_LCD_Pixie_l141) begin
            if(when_LCD_Pixie_l144) begin
              if(when_LCD_Pixie_l152) begin
                ScreenY_willIncrement = 1'b1;
              end
            end
          end
        end
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    ScreenY_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
      end
      fsm_enumDef_SendData : begin
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
        ScreenY_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign ScreenY_willOverflowIfInc = (ScreenY_value == 7'h7f);
  assign ScreenY_willOverflow = (ScreenY_willOverflowIfInc && ScreenY_willIncrement);
  always @(*) begin
    ScreenY_valueNext = (ScreenY_value + _zz_ScreenY_valueNext);
    if(ScreenY_willClear) begin
      ScreenY_valueNext = 7'h00;
    end
  end

  always @(*) begin
    PixleMul_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
      end
      fsm_enumDef_SendData : begin
        if(when_LCD_Pixie_l140) begin
          if(!when_LCD_Pixie_l141) begin
            if(when_LCD_Pixie_l144) begin
              if(when_LCD_Pixie_l150) begin
                PixleMul_willIncrement = 1'b1;
              end
              if(when_LCD_Pixie_l156) begin
                PixleMul_willIncrement = 1'b1;
              end
            end else begin
              if(sink_valid) begin
                PixleMul_willIncrement = 1'b1;
              end
            end
          end
        end
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    PixleMul_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
      end
      fsm_enumDef_SendData : begin
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
        PixleMul_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign PixleMul_willOverflowIfInc = (PixleMul_value == 2'b11);
  assign PixleMul_willOverflow = (PixleMul_willOverflowIfInc && PixleMul_willIncrement);
  always @(*) begin
    PixleMul_valueNext = (PixleMul_value + _zz_PixleMul_valueNext);
    if(PixleMul_willClear) begin
      PixleMul_valueNext = 2'b00;
    end
  end

  always @(*) begin
    Pixle_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
      end
      fsm_enumDef_SendData : begin
        if(when_LCD_Pixie_l140) begin
          if(!when_LCD_Pixie_l141) begin
            if(when_LCD_Pixie_l144) begin
              if(when_LCD_Pixie_l156) begin
                Pixle_willIncrement = 1'b1;
              end
            end else begin
              if(sink_valid) begin
                Pixle_willIncrement = 1'b1;
              end
            end
          end
        end
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    Pixle_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
      end
      fsm_enumDef_SendData : begin
      end
      fsm_enumDef_LoadColor : begin
        if(when_LCD_Pixie_l176) begin
          Pixle_willClear = 1'b1;
        end
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
        Pixle_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign Pixle_willOverflowIfInc = (Pixle_value == 4'b1000);
  assign Pixle_willOverflow = (Pixle_willOverflowIfInc && Pixle_willIncrement);
  always @(*) begin
    if(Pixle_willOverflow) begin
      Pixle_valueNext = 4'b0000;
    end else begin
      Pixle_valueNext = (Pixle_value + _zz_Pixle_valueNext);
    end
    if(Pixle_willClear) begin
      Pixle_valueNext = 4'b0000;
    end
  end

  assign pixelsNext = (pixels <<< 1);
  always @(*) begin
    colorOut = 16'h0000;
    if(when_LCD_Pixie_l93) begin
      colorOut = 16'hffff;
    end else begin
      colorOut = 16'h0000;
    end
  end

  assign when_LCD_Pixie_l93 = pixels[7];
  assign when_LCD_Pixie_l99 = (paramData == 9'h1ff);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_StartFrame : begin
      end
      fsm_enumDef_SendData : begin
      end
      fsm_enumDef_LoadColor : begin
      end
      fsm_enumDef_LoadColorHi : begin
      end
      fsm_enumDef_LoadColorLo : begin
      end
      fsm_enumDef_Finish : begin
      end
      fsm_enumDef_Done : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
        fsm_stateNext = fsm_enumDef_Wait_1;
      end
      fsm_enumDef_Wait_1 : begin
        if(tft_io_displayReady) begin
          fsm_stateNext = fsm_enumDef_Done;
        end
      end
      fsm_enumDef_StartFrame : begin
        if(when_LCD_Pixie_l126) begin
          fsm_stateNext = fsm_enumDef_SendData;
        end else begin
          fsm_stateNext = fsm_enumDef_SendData;
        end
      end
      fsm_enumDef_SendData : begin
        if(when_LCD_Pixie_l140) begin
          if(when_LCD_Pixie_l141) begin
            fsm_stateNext = fsm_enumDef_StartFrame;
          end else begin
            if(when_LCD_Pixie_l144) begin
              fsm_stateNext = fsm_enumDef_LoadColor;
            end else begin
              if(sink_valid) begin
                fsm_stateNext = fsm_enumDef_LoadColor;
              end
            end
          end
        end
      end
      fsm_enumDef_LoadColor : begin
        fsm_stateNext = fsm_enumDef_LoadColorHi;
      end
      fsm_enumDef_LoadColorHi : begin
        fsm_stateNext = fsm_enumDef_LoadColorLo;
      end
      fsm_enumDef_LoadColorLo : begin
        if(ScreenDone) begin
          fsm_stateNext = fsm_enumDef_Finish;
        end else begin
          fsm_stateNext = fsm_enumDef_SendData;
        end
      end
      fsm_enumDef_Finish : begin
        fsm_stateNext = fsm_enumDef_Done;
      end
      fsm_enumDef_Done : begin
        if(io_startFrame) begin
          fsm_stateNext = fsm_enumDef_StartFrame;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_Init;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign when_LCD_Pixie_l126 = (paramData == 9'h1ff);
  assign when_LCD_Pixie_l140 = (! tft_io_fifo_full);
  assign when_LCD_Pixie_l141 = (paramData != 9'h1ff);
  assign when_LCD_Pixie_l150 = (PixleMul_value != 2'b00);
  assign when_LCD_Pixie_l152 = (ScreenX_willOverflowIfInc && (! colorByte));
  assign when_LCD_Pixie_l156 = ((Pixle_value != 4'b0000) && (PixleMul_value == 2'b00));
  assign when_LCD_Pixie_l144 = (Pixle_value != 4'b0000);
  assign when_LCD_Pixie_l176 = ((Pixle_value == 4'b1000) && (PixleMul_value == 2'b00));
  assign when_StateMachine_l253 = ((! (fsm_stateReg == fsm_enumDef_LoadColorHi)) && (fsm_stateNext == fsm_enumDef_LoadColorHi));
  assign when_StateMachine_l253_1 = ((! (fsm_stateReg == fsm_enumDef_LoadColorLo)) && (fsm_stateNext == fsm_enumDef_LoadColorLo));
  always @(posedge Core48_clk) begin
    if(Core48_reset) begin
      byteCounter_value <= 11'h000;
      ParamsPointer_value <= 4'b0000;
      colorByte <= 1'b0;
      ScreenX_value <= 8'h00;
      ScreenY_value <= 7'h00;
      PixleMul_value <= 2'b00;
      Pixle_value <= 4'b0000;
      pixels <= 8'h00;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      byteCounter_value <= byteCounter_valueNext;
      ParamsPointer_value <= ParamsPointer_valueNext;
      ScreenX_value <= ScreenX_valueNext;
      ScreenY_value <= ScreenY_valueNext;
      PixleMul_value <= PixleMul_valueNext;
      Pixle_value <= Pixle_valueNext;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Init : begin
        end
        fsm_enumDef_Wait_1 : begin
        end
        fsm_enumDef_StartFrame : begin
        end
        fsm_enumDef_SendData : begin
          if(when_LCD_Pixie_l140) begin
            if(!when_LCD_Pixie_l141) begin
              if(when_LCD_Pixie_l144) begin
                if(when_LCD_Pixie_l156) begin
                  pixels <= pixelsNext;
                end
              end else begin
                if(sink_valid) begin
                  pixels <= sink_payload;
                end
              end
            end
          end
        end
        fsm_enumDef_LoadColor : begin
        end
        fsm_enumDef_LoadColorHi : begin
        end
        fsm_enumDef_LoadColorLo : begin
        end
        fsm_enumDef_Finish : begin
          colorByte <= 1'b0;
        end
        fsm_enumDef_Done : begin
          colorByte <= 1'b0;
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l253) begin
        colorByte <= 1'b1;
      end
      if(when_StateMachine_l253_1) begin
        colorByte <= 1'b0;
      end
    end
  end

  always @(posedge Core48_clk) begin
    ScreenDone <= (ScreenX_willOverflowIfInc && ScreenY_willOverflowIfInc);
  end


endmodule

//BufferCC_2 replaced by BufferCC

//BufferCC_1 replaced by BufferCC

module BufferCC (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          Core48_clk,
  input  wire          Core48_reset
);

  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge Core48_clk) begin
    if(Core48_reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module Keypad (
  input  wire          io_LatchKey,
  input  wire [3:0]    io_Key,
  output reg           io_KeyOut,
  input  wire [3:0]    io_KeypadCol,
  output reg  [3:0]    io_KeypadRow,
  input  wire          Core17_clk,
  input  wire          Core17_reset,
  input  wire          _zz_1
);

  reg        [3:0]    Key;
  wire                when_Keypad_l29;
  wire                when_Keypad_l31;
  wire                when_Keypad_l33;
  wire                when_Keypad_l35;

  always @(*) begin
    io_KeypadRow[0] = ((((Key == 4'b0001) || (Key == 4'b0010)) || (Key == 4'b0011)) || (Key == 4'b1100));
    io_KeypadRow[1] = ((((Key == 4'b0100) || (Key == 4'b0101)) || (Key == 4'b0110)) || (Key == 4'b1101));
    io_KeypadRow[2] = ((((Key == 4'b0111) || (Key == 4'b1000)) || (Key == 4'b1001)) || (Key == 4'b1110));
    io_KeypadRow[3] = ((((Key == 4'b1010) || (Key == 4'b0000)) || (Key == 4'b1011)) || (Key == 4'b1111));
  end

  assign when_Keypad_l29 = ((((Key == 4'b0001) || (Key == 4'b0100)) || (Key == 4'b0111)) || (Key == 4'b1010));
  always @(*) begin
    if(when_Keypad_l29) begin
      io_KeyOut = io_KeypadCol[0];
    end else begin
      if(when_Keypad_l31) begin
        io_KeyOut = io_KeypadCol[1];
      end else begin
        if(when_Keypad_l33) begin
          io_KeyOut = io_KeypadCol[2];
        end else begin
          if(when_Keypad_l35) begin
            io_KeyOut = io_KeypadCol[3];
          end else begin
            io_KeyOut = 1'b0;
          end
        end
      end
    end
  end

  assign when_Keypad_l31 = ((((Key == 4'b0010) || (Key == 4'b0101)) || (Key == 4'b1000)) || (Key == 4'b0000));
  assign when_Keypad_l33 = ((((Key == 4'b0011) || (Key == 4'b0110)) || (Key == 4'b1001)) || (Key == 4'b1011));
  assign when_Keypad_l35 = ((((Key == 4'b1100) || (Key == 4'b1101)) || (Key == 4'b1110)) || (Key == 4'b1111));
  always @(posedge Core17_clk) begin
    if(_zz_1) begin
      if(Core17_reset) begin
      Key <= 4'b0000;
      end else begin
        if(io_LatchKey) begin
          Key <= io_Key;
        end
      end
    end
  end


endmodule

module RamInit_1 (
  input  wire          io_ena,
  input  wire [0:0]    io_wea,
  input  wire [12:0]   io_addra,
  output wire [7:0]    io_douta,
  input  wire [7:0]    io_dina,
  input  wire          Core17_clk,
  input  wire          Core17_reset,
  input  wire          _zz_3
);

  reg        [7:0]    _zz_mem_port1;
  wire       [12:0]   _zz_mem_port;
  wire                _zz_mem_port_1;
  wire       [12:0]   _zz_io_douta;
  reg [7:0] mem [0:8191];

  assign _zz_mem_port = io_addra;
  assign _zz_mem_port_1 = (io_ena && io_wea[0]);
  initial begin
    $readmemb("Top_ICE40.v_toplevel_Core17_areaDiv_Ram_mem.bin",mem);
  end
  always @(posedge Core17_clk) begin
    if(_zz_3) begin
      if(_zz_mem_port_1) begin
        mem[_zz_mem_port] <= io_dina;
      end
    end
  end

  always @(posedge Core17_clk) begin
    if(_zz_3) begin
      if(io_ena) begin
        _zz_mem_port1 <= mem[_zz_io_douta];
      end
    end
  end

  assign _zz_io_douta = io_addra;
  assign io_douta = _zz_mem_port1;

endmodule

module RamInit (
  input  wire          io_ena,
  input  wire [0:0]    io_wea,
  input  wire [8:0]    io_addra,
  output wire [7:0]    io_douta,
  input  wire [7:0]    io_dina,
  input  wire          Core17_clk,
  input  wire          Core17_reset,
  input  wire          _zz_3
);

  reg        [7:0]    _zz_mem_port1;
  wire       [8:0]    _zz_mem_port;
  wire                _zz_mem_port_1;
  wire       [8:0]    _zz_io_douta;
  reg [7:0] mem [0:511];

  assign _zz_mem_port = io_addra;
  assign _zz_mem_port_1 = (io_ena && io_wea[0]);
  initial begin
    $readmemb("Top_ICE40.v_toplevel_Core17_areaDiv_Rom_mem.bin",mem);
  end
  always @(posedge Core17_clk) begin
    if(_zz_3) begin
      if(_zz_mem_port_1) begin
        mem[_zz_mem_port] <= io_dina;
      end
    end
  end

  always @(posedge Core17_clk) begin
    if(_zz_3) begin
      if(io_ena) begin
        _zz_mem_port1 <= mem[_zz_io_douta];
      end
    end
  end

  assign _zz_io_douta = io_addra;
  assign io_douta = _zz_mem_port1;

endmodule

module Spinal1861 (
  input  wire          io_Reset_,
  input  wire          io_Disp_On,
  input  wire          io_Disp_Off,
  input  wire          io_TPA,
  input  wire          io_TPB,
  input  wire [1:0]    io_SC,
  input  wire [7:0]    io_DataIn,
  output reg           io_Clear,
  output reg           io_INT,
  output reg           io_DMAO,
  output reg           io_EFx,
  output wire          io_Video,
  output wire          io_CompSync_,
  output wire          io_Locked,
  output wire          io_VSync,
  output wire          io_HSync,
  input  wire          Core17_clk,
  input  wire          Core17_reset,
  input  wire          _zz_1
);

  wire       [8:0]    _zz_lineCounter_valueNext;
  wire       [0:0]    _zz_lineCounter_valueNext_1;
  wire       [4:0]    _zz_MCycleCounter_valueNext;
  wire       [0:0]    _zz_MCycleCounter_valueNext_1;
  wire       [3:0]    _zz_syncCounter_valueNext;
  wire       [0:0]    _zz_syncCounter_valueNext_1;
  reg                 lineCounter_willIncrement;
  reg                 lineCounter_willClear;
  reg        [8:0]    lineCounter_valueNext;
  reg        [8:0]    lineCounter_value;
  wire                lineCounter_willOverflowIfInc;
  wire                lineCounter_willOverflow;
  reg                 MCycleCounter_willIncrement;
  reg                 MCycleCounter_willClear;
  reg        [4:0]    MCycleCounter_valueNext;
  reg        [4:0]    MCycleCounter_value;
  wire                MCycleCounter_willOverflowIfInc;
  wire                MCycleCounter_willOverflow;
  reg                 syncCounter_willIncrement;
  reg                 syncCounter_willClear;
  reg        [3:0]    syncCounter_valueNext;
  reg        [3:0]    syncCounter_value;
  wire                syncCounter_willOverflowIfInc;
  wire                syncCounter_willOverflow;
  wire                when_Spinal1861_l54;
  wire                when_Spinal1861_l61;
  wire                when_Spinal1861_l67;
  reg                 DisplayOn;
  reg                 io_Disp_On_regNext;
  wire                when_Spinal1861_l77;
  reg                 io_Disp_Off_regNext;
  wire                when_Spinal1861_l79;
  wire                when_Spinal1861_l84;
  wire                when_Spinal1861_l88;
  reg                 InvertedArea_VSync;
  reg                 InvertedArea_HSync;
  wire                when_Spinal1861_l101;
  wire                when_Spinal1861_l106;
  wire                when_Spinal1861_l111;
  reg        [3:0]    _zz_when_ClockDomain_l426;
  wire                when_ClockDomain_l426;
  reg                 when_ClockDomain_l426_regNext;
  reg        [7:0]    InvertedArea_areaDiv_VideoShiftReg;
  wire                when_Spinal1861_l118;
  wire                when_Spinal1861_l120;

  assign _zz_lineCounter_valueNext_1 = lineCounter_willIncrement;
  assign _zz_lineCounter_valueNext = {8'd0, _zz_lineCounter_valueNext_1};
  assign _zz_MCycleCounter_valueNext_1 = MCycleCounter_willIncrement;
  assign _zz_MCycleCounter_valueNext = {4'd0, _zz_MCycleCounter_valueNext_1};
  assign _zz_syncCounter_valueNext_1 = syncCounter_willIncrement;
  assign _zz_syncCounter_valueNext = {3'd0, _zz_syncCounter_valueNext_1};
  always @(*) begin
    io_Clear = 1'b1;
    if(when_Spinal1861_l54) begin
      io_Clear = 1'b0;
    end
  end

  always @(*) begin
    lineCounter_willIncrement = 1'b0;
    if(MCycleCounter_willOverflow) begin
      lineCounter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    lineCounter_willClear = 1'b0;
    if(when_Spinal1861_l54) begin
      lineCounter_willClear = 1'b1;
    end
  end

  assign lineCounter_willOverflowIfInc = (lineCounter_value == 9'h106);
  assign lineCounter_willOverflow = (lineCounter_willOverflowIfInc && lineCounter_willIncrement);
  always @(*) begin
    if(lineCounter_willOverflow) begin
      lineCounter_valueNext = 9'h000;
    end else begin
      lineCounter_valueNext = (lineCounter_value + _zz_lineCounter_valueNext);
    end
    if(lineCounter_willClear) begin
      lineCounter_valueNext = 9'h000;
    end
  end

  always @(*) begin
    MCycleCounter_willIncrement = 1'b0;
    if(when_Spinal1861_l67) begin
      MCycleCounter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    MCycleCounter_willClear = 1'b0;
    if(when_Spinal1861_l54) begin
      MCycleCounter_willClear = 1'b1;
    end
  end

  assign MCycleCounter_willOverflowIfInc = (MCycleCounter_value == 5'h1b);
  assign MCycleCounter_willOverflow = (MCycleCounter_willOverflowIfInc && MCycleCounter_willIncrement);
  always @(*) begin
    if(MCycleCounter_willOverflow) begin
      MCycleCounter_valueNext = 5'h00;
    end else begin
      MCycleCounter_valueNext = (MCycleCounter_value + _zz_MCycleCounter_valueNext);
    end
    if(MCycleCounter_willClear) begin
      MCycleCounter_valueNext = 5'h00;
    end
  end

  always @(*) begin
    syncCounter_willIncrement = 1'b0;
    if(when_Spinal1861_l61) begin
      syncCounter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    syncCounter_willClear = 1'b0;
    if(when_Spinal1861_l54) begin
      syncCounter_willClear = 1'b1;
    end
  end

  assign syncCounter_willOverflowIfInc = (syncCounter_value == 4'b1011);
  assign syncCounter_willOverflow = (syncCounter_willOverflowIfInc && syncCounter_willIncrement);
  always @(*) begin
    if(syncCounter_willOverflow) begin
      syncCounter_valueNext = 4'b0000;
    end else begin
      syncCounter_valueNext = (syncCounter_value + _zz_syncCounter_valueNext);
    end
    if(syncCounter_willClear) begin
      syncCounter_valueNext = 4'b0000;
    end
  end

  assign when_Spinal1861_l54 = (! io_Reset_);
  assign when_Spinal1861_l61 = ((syncCounter_value != 4'b0000) || ((((MCycleCounter_value == 5'h1a) && (lineCounter_value == 9'h000)) && io_TPA) && (io_SC != 2'b00)));
  assign io_Locked = (syncCounter_value == 4'b0000);
  assign when_Spinal1861_l67 = ((io_TPB || io_TPA) && (syncCounter_value == 4'b0000));
  assign when_Spinal1861_l77 = (io_Disp_On && (! io_Disp_On_regNext));
  assign when_Spinal1861_l79 = ((io_Disp_Off && (! io_Disp_Off_regNext)) || (! io_Reset_));
  assign when_Spinal1861_l84 = (((lineCounter_value == 9'h04e) || (lineCounter_value == 9'h04f)) && DisplayOn);
  always @(*) begin
    if(when_Spinal1861_l84) begin
      io_INT = 1'b0;
    end else begin
      io_INT = 1'b1;
    end
  end

  assign when_Spinal1861_l88 = (((9'h04c <= lineCounter_value) && (lineCounter_value <= 9'h04f)) || ((9'h0cd <= lineCounter_value) && (lineCounter_value <= 9'h0cf)));
  always @(*) begin
    if(when_Spinal1861_l88) begin
      io_EFx = 1'b0;
    end else begin
      io_EFx = 1'b1;
    end
  end

  assign io_CompSync_ = (! (InvertedArea_HSync ^ InvertedArea_VSync));
  assign when_Spinal1861_l101 = (9'h010 <= lineCounter_value);
  always @(*) begin
    if(when_Spinal1861_l101) begin
      InvertedArea_VSync = 1'b1;
    end else begin
      InvertedArea_VSync = 1'b0;
    end
  end

  assign when_Spinal1861_l106 = ((5'h03 <= MCycleCounter_value) || ((MCycleCounter_value == 5'h02) && io_TPA));
  always @(*) begin
    if(when_Spinal1861_l106) begin
      InvertedArea_HSync = 1'b1;
    end else begin
      InvertedArea_HSync = 1'b0;
    end
  end

  assign when_Spinal1861_l111 = ((((9'h050 <= lineCounter_value) && (lineCounter_value <= 9'h0cf)) && (((MCycleCounter_value == 5'h02) && io_TPA) || ((5'h03 <= MCycleCounter_value) && (MCycleCounter_value <= 5'h13)))) && DisplayOn);
  always @(*) begin
    if(when_Spinal1861_l111) begin
      io_DMAO = 1'b0;
    end else begin
      io_DMAO = 1'b1;
    end
  end

  assign when_ClockDomain_l426 = (_zz_when_ClockDomain_l426 == 4'b1001);
  assign when_Spinal1861_l118 = ((io_SC == 2'b10) && io_TPB);
  assign when_Spinal1861_l120 = (! io_Reset_);
  assign io_Video = InvertedArea_areaDiv_VideoShiftReg[7];
  assign io_VSync = InvertedArea_VSync;
  assign io_HSync = (! InvertedArea_HSync);
  always @(posedge Core17_clk) begin
    if(_zz_1) begin
      if(Core17_reset) begin
      lineCounter_value <= 9'h000;
      MCycleCounter_value <= 5'h00;
      syncCounter_value <= 4'b0000;
      DisplayOn <= 1'b0;
      end else begin
        lineCounter_value <= lineCounter_valueNext;
        MCycleCounter_value <= MCycleCounter_valueNext;
        syncCounter_value <= syncCounter_valueNext;
        if(when_Spinal1861_l77) begin
          DisplayOn <= 1'b1;
        end else begin
          if(when_Spinal1861_l79) begin
            DisplayOn <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge Core17_clk) begin
    if(_zz_1) begin
      io_Disp_On_regNext <= io_Disp_On;
      io_Disp_Off_regNext <= io_Disp_Off;
    end
  end

  always @(negedge Core17_clk or posedge Core17_reset) begin
    if(Core17_reset) begin
      _zz_when_ClockDomain_l426 <= 4'b0000;
      when_ClockDomain_l426_regNext <= 1'b0;
    end else begin
      _zz_when_ClockDomain_l426 <= (_zz_when_ClockDomain_l426 + 4'b0001);
      if(when_ClockDomain_l426) begin
        _zz_when_ClockDomain_l426 <= 4'b0000;
      end
      when_ClockDomain_l426_regNext <= when_ClockDomain_l426;
    end
  end

  always @(negedge Core17_clk or posedge Core17_reset) begin
    if(Core17_reset) begin
      InvertedArea_areaDiv_VideoShiftReg <= 8'h00;
    end else begin
      if(when_ClockDomain_l426_regNext) begin
        if(when_Spinal1861_l118) begin
          InvertedArea_areaDiv_VideoShiftReg <= io_DataIn;
        end else begin
          if(when_Spinal1861_l120) begin
            InvertedArea_areaDiv_VideoShiftReg <= 8'h00;
          end else begin
            InvertedArea_areaDiv_VideoShiftReg <= (InvertedArea_areaDiv_VideoShiftReg <<< 1);
          end
        end
      end
    end
  end


endmodule

module Spinal1802 (
  input  wire          io_Wait_n,
  input  wire          io_Clear_n,
  input  wire          io_DMA_In_n,
  input  wire          io_DMA_Out_n,
  input  wire          io_Interrupt_n,
  input  wire [3:0]    io_EF_n,
  output wire          io_Q,
  output wire [1:0]    io_SC,
  output wire [2:0]    io_N,
  output wire          io_TPA,
  output wire          io_TPB,
  output wire          io_MRD,
  output wire          io_MWR,
  output reg  [7:0]    io_Addr,
  output wire [15:0]   io_Addr16,
  input  wire [7:0]    io_DataIn,
  output wire [7:0]    io_DataOut,
  input  wire          Core17_clk,
  input  wire          Core17_reset,
  input  wire          _zz_18
);
  localparam CPUModes_Load = 2'd0;
  localparam CPUModes_Reset = 2'd1;
  localparam CPUModes_Pause = 2'd2;
  localparam CPUModes_Run = 2'd3;
  localparam RegSelectModes_PSel = 3'd0;
  localparam RegSelectModes_NSel = 3'd1;
  localparam RegSelectModes_XSel = 3'd2;
  localparam RegSelectModes_DMA0 = 3'd3;
  localparam RegSelectModes_Stack2 = 3'd4;
  localparam RegOperationModes_None = 4'd0;
  localparam RegOperationModes_Inc = 4'd1;
  localparam RegOperationModes_Dec = 4'd2;
  localparam RegOperationModes_LoadUpper = 4'd3;
  localparam RegOperationModes_LoadLower = 4'd4;
  localparam RegOperationModes_UpperOnBus = 4'd5;
  localparam RegOperationModes_LowerOnBus = 4'd6;
  localparam RegOperationModes_LoadTemp = 4'd7;
  localparam RegOperationModes_LoadJump = 4'd8;
  localparam ExecuteModes_None = 4'd0;
  localparam ExecuteModes_Load = 4'd1;
  localparam ExecuteModes_LoadDec = 4'd2;
  localparam ExecuteModes_LoadNoInc = 4'd3;
  localparam ExecuteModes_Write = 4'd4;
  localparam ExecuteModes_WriteDec = 4'd5;
  localparam ExecuteModes_WriteNoInc = 4'd6;
  localparam ExecuteModes_LongLoad = 4'd7;
  localparam ExecuteModes_LongContinue = 4'd8;
  localparam ExecuteModes_DMA_In = 4'd9;
  localparam ExecuteModes_DMA_Out = 4'd10;
  localparam BusControlModes_DataIn = 3'd0;
  localparam BusControlModes_DReg = 3'd1;
  localparam BusControlModes_TReg = 3'd2;
  localparam BusControlModes_PXReg = 3'd3;
  localparam BusControlModes_RLower = 3'd4;
  localparam BusControlModes_RUpper = 3'd5;
  localparam DRegControlModes_None = 4'd0;
  localparam DRegControlModes_BusIn = 4'd1;
  localparam DRegControlModes_ALU_OR = 4'd2;
  localparam DRegControlModes_ALU_XOR = 4'd3;
  localparam DRegControlModes_ALU_AND = 4'd4;
  localparam DRegControlModes_ALU_RSH = 4'd5;
  localparam DRegControlModes_ALU_LSH = 4'd6;
  localparam DRegControlModes_ALU_RSHR = 4'd7;
  localparam DRegControlModes_ALU_LSHR = 4'd8;
  localparam DRegControlModes_ALU_Add = 4'd9;
  localparam DRegControlModes_ALU_AddCarry = 4'd10;
  localparam DRegControlModes_ALU_SubD = 4'd11;
  localparam DRegControlModes_ALU_SubDBorrow = 4'd12;
  localparam DRegControlModes_ALU_SubM = 4'd13;
  localparam DRegControlModes_ALU_SubMBorrow = 4'd14;
  localparam CoreFMS_enumDef_BOOT = 3'd0;
  localparam CoreFMS_enumDef_S1_Reset = 3'd1;
  localparam CoreFMS_enumDef_S1_Init = 3'd2;
  localparam CoreFMS_enumDef_S0_Fetch = 3'd3;
  localparam CoreFMS_enumDef_S1_Execute = 3'd4;
  localparam CoreFMS_enumDef_S2_DMA = 3'd5;
  localparam CoreFMS_enumDef_S3_INT = 3'd6;

  wire       [2:0]    _zz_StateCounter_valueNext;
  wire       [0:0]    _zz_StateCounter_valueNext_1;
  wire       [3:0]    _zz_Skip;
  wire       [3:0]    _zz_Skip_1;
  reg        [15:0]   _zz__zz_A;
  wire       [3:0]    _zz_when_Spinal1802_l189;
  wire       [3:0]    _zz_when_Spinal1802_l189_1;
  wire       [8:0]    _zz_ALU_Add;
  wire       [8:0]    _zz_ALU_Add_1;
  wire       [8:0]    _zz_ALU_SubD;
  wire       [8:0]    _zz_ALU_SubD_1;
  wire       [8:0]    _zz_ALU_SubM;
  wire       [8:0]    _zz_ALU_SubM_1;
  wire       [7:0]    _zz_D;
  wire       [7:0]    _zz_D_1;
  reg        [1:0]    SC;
  reg                 Q;
  reg                 TPA;
  reg                 TPB;
  reg                 MRD;
  reg                 MWR;
  reg                 StateCounter_willIncrement;
  reg                 StateCounter_willClear;
  reg        [2:0]    StateCounter_valueNext;
  reg        [2:0]    StateCounter_value;
  wire                StateCounter_willOverflowIfInc;
  wire                StateCounter_willOverflow;
  reg                 StartCounting;
  reg        [1:0]    Mode;
  reg        [2:0]    RegSelMode;
  reg        [3:0]    RegOpMode;
  reg        [3:0]    ExeMode;
  reg        [2:0]    BusControl;
  reg        [3:0]    DRegControl;
  reg        [15:0]   Addr;
  reg        [15:0]   Addr16;
  reg        [7:0]    D;
  reg        [7:0]    Dlast;
  reg        [2:0]    outN;
  reg        [3:0]    N;
  reg        [3:0]    I;
  reg        [3:0]    P;
  reg        [3:0]    X;
  reg        [7:0]    T;
  reg        [3:0]    EF;
  reg                 IE;
  reg                 DF;
  reg                 DFLast;
  reg        [7:0]    OP;
  reg                 Idle;
  reg                 Reset;
  reg                 Branch;
  wire                Skip;
  reg        [7:0]    TmpUpper;
  wire       [8:0]    ALU_Add;
  wire       [8:0]    ALU_AddCarry;
  wire       [8:0]    ALU_SubD;
  wire       [8:0]    ALU_SubM;
  wire       [8:0]    ALU_SubDB;
  wire       [8:0]    ALU_SubMB;
  reg        [7:0]    Bus_1;
  wire       [15:0]   A;
  reg        [3:0]    RSel;
  reg        [15:0]   R_0;
  reg        [15:0]   R_1;
  reg        [15:0]   R_2;
  reg        [15:0]   R_3;
  reg        [15:0]   R_4;
  reg        [15:0]   R_5;
  reg        [15:0]   R_6;
  reg        [15:0]   R_7;
  reg        [15:0]   R_8;
  reg        [15:0]   R_9;
  reg        [15:0]   R_10;
  reg        [15:0]   R_11;
  reg        [15:0]   R_12;
  reg        [15:0]   R_13;
  reg        [15:0]   R_14;
  reg        [15:0]   R_15;
  wire       [15:0]   _zz_A;
  wire       [15:0]   _zz_1;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire                _zz_6;
  wire                _zz_7;
  wire                _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire                _zz_14;
  wire                _zz_15;
  wire                _zz_16;
  wire                _zz_17;
  wire                when_Spinal1802_l124;
  wire                when_Spinal1802_l129;
  wire                when_Spinal1802_l131;
  wire                when_Spinal1802_l133;
  wire                when_Spinal1802_l138;
  wire                when_Spinal1802_l142;
  wire                when_Spinal1802_l147;
  wire                when_Spinal1802_l149;
  wire                when_Spinal1802_l151;
  wire                when_Spinal1802_l153;
  wire       [15:0]   _zz_R_0;
  wire       [15:0]   _zz_R_0_1;
  wire       [15:0]   _zz_R_0_2;
  wire       [15:0]   _zz_R_0_3;
  wire       [15:0]   _zz_R_0_4;
  wire                when_Spinal1802_l160;
  wire                when_Spinal1802_l162;
  wire                when_Spinal1802_l164;
  wire                when_Spinal1802_l166;
  wire                when_Spinal1802_l168;
  wire                when_Spinal1802_l170;
  wire                when_Spinal1802_l177;
  wire                when_Spinal1802_l181;
  wire                when_Spinal1802_l186;
  wire                when_Spinal1802_l187;
  wire                when_Spinal1802_l189;
  wire                when_Spinal1802_l199;
  wire                when_Spinal1802_l203;
  wire                when_Spinal1802_l219;
  wire                when_Spinal1802_l221;
  wire                when_Spinal1802_l223;
  wire                when_Spinal1802_l225;
  wire                when_Spinal1802_l227;
  wire                when_Spinal1802_l230;
  wire                when_Spinal1802_l233;
  wire                when_Spinal1802_l236;
  wire                when_Spinal1802_l239;
  wire                when_Spinal1802_l242;
  wire                when_Spinal1802_l245;
  wire                when_Spinal1802_l248;
  wire                when_Spinal1802_l251;
  wire                when_Spinal1802_l254;
  wire                when_Spinal1802_l260;
  wire                when_Spinal1802_l262;
  wire                when_Spinal1802_l264;
  wire                when_Spinal1802_l266;
  wire                when_Spinal1802_l268;
  wire                when_Spinal1802_l270;
  wire                when_Spinal1802_l275;
  wire                when_Spinal1802_l277;
  wire                when_Spinal1802_l279;
  wire                when_Spinal1802_l281;
  wire                when_Spinal1802_l283;
  wire                when_Spinal1802_l285;
  wire                when_Spinal1802_l287;
  wire                when_Spinal1802_l289;
  wire                when_Spinal1802_l291;
  wire                when_Spinal1802_l293;
  wire                CoreFMS_wantExit;
  reg                 CoreFMS_wantStart;
  wire                CoreFMS_wantKill;
  reg        [3:0]    _zz_when_State_l238;
  reg        [2:0]    CoreFMS_stateReg;
  reg        [2:0]    CoreFMS_stateNext;
  wire                when_Spinal1802_l304;
  wire                when_State_l238;
  wire                when_Spinal1802_l333;
  wire                when_Spinal1802_l344;
  wire                when_Spinal1802_l349;
  wire                when_Spinal1802_l352;
  wire                when_Spinal1802_l355;
  wire                when_Spinal1802_l360;
  wire                when_Spinal1802_l363;
  wire                when_Spinal1802_l367;
  wire                when_Spinal1802_l391;
  wire                when_Spinal1802_l393;
  wire                when_Spinal1802_l398;
  wire                when_Spinal1802_l401;
  wire                when_Spinal1802_l404;
  wire                when_Spinal1802_l407;
  wire                when_Spinal1802_l410;
  wire                when_Spinal1802_l414;
  wire                when_Spinal1802_l434;
  wire                when_Spinal1802_l437;
  wire                when_Spinal1802_l443;
  wire                when_Spinal1802_l456;
  wire                when_Spinal1802_l458;
  wire                when_Spinal1802_l460;
  wire                when_Spinal1802_l464;
  wire                when_Spinal1802_l469;
  wire                when_Spinal1802_l473;
  wire                when_Spinal1802_l479;
  wire                when_Spinal1802_l481;
  wire                when_Spinal1802_l488;
  wire                when_Spinal1802_l491;
  wire                when_Spinal1802_l506;
  wire                when_Spinal1802_l508;
  wire                when_Spinal1802_l513;
  wire                when_Spinal1802_l517;
  wire                when_Spinal1802_l519;
  wire                when_Spinal1802_l521;
  wire                when_Spinal1802_l523;
  wire                when_Spinal1802_l525;
  wire                when_Spinal1802_l527;
  wire                when_Spinal1802_l529;
  wire                when_Spinal1802_l531;
  wire                when_Spinal1802_l554;
  wire                when_Spinal1802_l555;
  wire                when_Spinal1802_l558;
  wire                when_Spinal1802_l572;
  wire                when_Spinal1802_l574;
  wire                when_Spinal1802_l576;
  wire                when_Spinal1802_l578;
  wire                when_Spinal1802_l580;
  wire                when_Spinal1802_l582;
  wire                when_Spinal1802_l584;
  wire                when_Spinal1802_l586;
  wire                when_Spinal1802_l588;
  wire                when_Spinal1802_l590;
  wire                when_Spinal1802_l597;
  wire                when_Spinal1802_l598;
  wire                when_Spinal1802_l602;
  wire                when_Spinal1802_l604;
  wire                when_Spinal1802_l606;
  wire                when_Spinal1802_l608;
  wire                when_Spinal1802_l621;
  wire                when_Spinal1802_l625;
  wire                when_Spinal1802_l639;
  wire                when_Spinal1802_l629;
  wire                when_Spinal1802_l633;
  wire                when_Spinal1802_l636;
  wire                when_Spinal1802_l651;
  wire                when_Spinal1802_l656;
  wire                when_Spinal1802_l660;
  wire                when_Spinal1802_l663;
  wire                when_Spinal1802_l666;
  wire                when_Spinal1802_l668;
  wire                when_Spinal1802_l684;
  wire                when_Spinal1802_l688;
  wire                when_Spinal1802_l693;
  wire                when_Spinal1802_l697;
  wire                when_Spinal1802_l700;
  wire                when_StateMachine_l253;
  `ifndef SYNTHESIS
  reg [39:0] Mode_string;
  reg [47:0] RegSelMode_string;
  reg [79:0] RegOpMode_string;
  reg [95:0] ExeMode_string;
  reg [47:0] BusControl_string;
  reg [111:0] DRegControl_string;
  reg [79:0] CoreFMS_stateReg_string;
  reg [79:0] CoreFMS_stateNext_string;
  `endif


  assign _zz_StateCounter_valueNext_1 = StateCounter_willIncrement;
  assign _zz_StateCounter_valueNext = {2'd0, _zz_StateCounter_valueNext_1};
  assign _zz_ALU_Add = {1'd0, Bus_1};
  assign _zz_ALU_Add_1 = {1'd0, D};
  assign _zz_ALU_SubD = {1'd0, Bus_1};
  assign _zz_ALU_SubD_1 = {1'd0, D};
  assign _zz_ALU_SubM = {1'd0, D};
  assign _zz_ALU_SubM_1 = {1'd0, Bus_1};
  assign _zz_D = (D >>> 1);
  assign _zz_D_1 = (D <<< 1);
  assign _zz_Skip = 4'b0100;
  assign _zz_Skip_1 = 4'b0101;
  assign _zz_when_Spinal1802_l189 = ExecuteModes_Load;
  assign _zz_when_Spinal1802_l189_1 = ExecuteModes_LongLoad;
  always @(*) begin
    case(RSel)
      4'b0000 : _zz__zz_A = R_0;
      4'b0001 : _zz__zz_A = R_1;
      4'b0010 : _zz__zz_A = R_2;
      4'b0011 : _zz__zz_A = R_3;
      4'b0100 : _zz__zz_A = R_4;
      4'b0101 : _zz__zz_A = R_5;
      4'b0110 : _zz__zz_A = R_6;
      4'b0111 : _zz__zz_A = R_7;
      4'b1000 : _zz__zz_A = R_8;
      4'b1001 : _zz__zz_A = R_9;
      4'b1010 : _zz__zz_A = R_10;
      4'b1011 : _zz__zz_A = R_11;
      4'b1100 : _zz__zz_A = R_12;
      4'b1101 : _zz__zz_A = R_13;
      4'b1110 : _zz__zz_A = R_14;
      default : _zz__zz_A = R_15;
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(Mode)
      CPUModes_Load : Mode_string = "Load ";
      CPUModes_Reset : Mode_string = "Reset";
      CPUModes_Pause : Mode_string = "Pause";
      CPUModes_Run : Mode_string = "Run  ";
      default : Mode_string = "?????";
    endcase
  end
  always @(*) begin
    case(RegSelMode)
      RegSelectModes_PSel : RegSelMode_string = "PSel  ";
      RegSelectModes_NSel : RegSelMode_string = "NSel  ";
      RegSelectModes_XSel : RegSelMode_string = "XSel  ";
      RegSelectModes_DMA0 : RegSelMode_string = "DMA0  ";
      RegSelectModes_Stack2 : RegSelMode_string = "Stack2";
      default : RegSelMode_string = "??????";
    endcase
  end
  always @(*) begin
    case(RegOpMode)
      RegOperationModes_None : RegOpMode_string = "None      ";
      RegOperationModes_Inc : RegOpMode_string = "Inc       ";
      RegOperationModes_Dec : RegOpMode_string = "Dec       ";
      RegOperationModes_LoadUpper : RegOpMode_string = "LoadUpper ";
      RegOperationModes_LoadLower : RegOpMode_string = "LoadLower ";
      RegOperationModes_UpperOnBus : RegOpMode_string = "UpperOnBus";
      RegOperationModes_LowerOnBus : RegOpMode_string = "LowerOnBus";
      RegOperationModes_LoadTemp : RegOpMode_string = "LoadTemp  ";
      RegOperationModes_LoadJump : RegOpMode_string = "LoadJump  ";
      default : RegOpMode_string = "??????????";
    endcase
  end
  always @(*) begin
    case(ExeMode)
      ExecuteModes_None : ExeMode_string = "None        ";
      ExecuteModes_Load : ExeMode_string = "Load        ";
      ExecuteModes_LoadDec : ExeMode_string = "LoadDec     ";
      ExecuteModes_LoadNoInc : ExeMode_string = "LoadNoInc   ";
      ExecuteModes_Write : ExeMode_string = "Write       ";
      ExecuteModes_WriteDec : ExeMode_string = "WriteDec    ";
      ExecuteModes_WriteNoInc : ExeMode_string = "WriteNoInc  ";
      ExecuteModes_LongLoad : ExeMode_string = "LongLoad    ";
      ExecuteModes_LongContinue : ExeMode_string = "LongContinue";
      ExecuteModes_DMA_In : ExeMode_string = "DMA_In      ";
      ExecuteModes_DMA_Out : ExeMode_string = "DMA_Out     ";
      default : ExeMode_string = "????????????";
    endcase
  end
  always @(*) begin
    case(BusControl)
      BusControlModes_DataIn : BusControl_string = "DataIn";
      BusControlModes_DReg : BusControl_string = "DReg  ";
      BusControlModes_TReg : BusControl_string = "TReg  ";
      BusControlModes_PXReg : BusControl_string = "PXReg ";
      BusControlModes_RLower : BusControl_string = "RLower";
      BusControlModes_RUpper : BusControl_string = "RUpper";
      default : BusControl_string = "??????";
    endcase
  end
  always @(*) begin
    case(DRegControl)
      DRegControlModes_None : DRegControl_string = "None          ";
      DRegControlModes_BusIn : DRegControl_string = "BusIn         ";
      DRegControlModes_ALU_OR : DRegControl_string = "ALU_OR        ";
      DRegControlModes_ALU_XOR : DRegControl_string = "ALU_XOR       ";
      DRegControlModes_ALU_AND : DRegControl_string = "ALU_AND       ";
      DRegControlModes_ALU_RSH : DRegControl_string = "ALU_RSH       ";
      DRegControlModes_ALU_LSH : DRegControl_string = "ALU_LSH       ";
      DRegControlModes_ALU_RSHR : DRegControl_string = "ALU_RSHR      ";
      DRegControlModes_ALU_LSHR : DRegControl_string = "ALU_LSHR      ";
      DRegControlModes_ALU_Add : DRegControl_string = "ALU_Add       ";
      DRegControlModes_ALU_AddCarry : DRegControl_string = "ALU_AddCarry  ";
      DRegControlModes_ALU_SubD : DRegControl_string = "ALU_SubD      ";
      DRegControlModes_ALU_SubDBorrow : DRegControl_string = "ALU_SubDBorrow";
      DRegControlModes_ALU_SubM : DRegControl_string = "ALU_SubM      ";
      DRegControlModes_ALU_SubMBorrow : DRegControl_string = "ALU_SubMBorrow";
      default : DRegControl_string = "??????????????";
    endcase
  end
  always @(*) begin
    case(CoreFMS_stateReg)
      CoreFMS_enumDef_BOOT : CoreFMS_stateReg_string = "BOOT      ";
      CoreFMS_enumDef_S1_Reset : CoreFMS_stateReg_string = "S1_Reset  ";
      CoreFMS_enumDef_S1_Init : CoreFMS_stateReg_string = "S1_Init   ";
      CoreFMS_enumDef_S0_Fetch : CoreFMS_stateReg_string = "S0_Fetch  ";
      CoreFMS_enumDef_S1_Execute : CoreFMS_stateReg_string = "S1_Execute";
      CoreFMS_enumDef_S2_DMA : CoreFMS_stateReg_string = "S2_DMA    ";
      CoreFMS_enumDef_S3_INT : CoreFMS_stateReg_string = "S3_INT    ";
      default : CoreFMS_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(CoreFMS_stateNext)
      CoreFMS_enumDef_BOOT : CoreFMS_stateNext_string = "BOOT      ";
      CoreFMS_enumDef_S1_Reset : CoreFMS_stateNext_string = "S1_Reset  ";
      CoreFMS_enumDef_S1_Init : CoreFMS_stateNext_string = "S1_Init   ";
      CoreFMS_enumDef_S0_Fetch : CoreFMS_stateNext_string = "S0_Fetch  ";
      CoreFMS_enumDef_S1_Execute : CoreFMS_stateNext_string = "S1_Execute";
      CoreFMS_enumDef_S2_DMA : CoreFMS_stateNext_string = "S2_DMA    ";
      CoreFMS_enumDef_S3_INT : CoreFMS_stateNext_string = "S3_INT    ";
      default : CoreFMS_stateNext_string = "??????????";
    endcase
  end
  `endif

  always @(*) begin
    StateCounter_willIncrement = 1'b0;
    if(when_Spinal1802_l124) begin
      StateCounter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    StateCounter_willClear = 1'b0;
    case(CoreFMS_stateReg)
      CoreFMS_enumDef_S1_Reset : begin
      end
      CoreFMS_enumDef_S1_Init : begin
        StateCounter_willClear = 1'b1;
      end
      CoreFMS_enumDef_S0_Fetch : begin
      end
      CoreFMS_enumDef_S1_Execute : begin
      end
      CoreFMS_enumDef_S2_DMA : begin
      end
      CoreFMS_enumDef_S3_INT : begin
      end
      default : begin
      end
    endcase
  end

  assign StateCounter_willOverflowIfInc = (StateCounter_value == 3'b111);
  assign StateCounter_willOverflow = (StateCounter_willOverflowIfInc && StateCounter_willIncrement);
  always @(*) begin
    StateCounter_valueNext = (StateCounter_value + _zz_StateCounter_valueNext);
    if(StateCounter_willClear) begin
      StateCounter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    Reset = 1'b0;
    case(CoreFMS_stateReg)
      CoreFMS_enumDef_S1_Reset : begin
      end
      CoreFMS_enumDef_S1_Init : begin
        Reset = 1'b1;
      end
      CoreFMS_enumDef_S0_Fetch : begin
        Reset = 1'b0;
      end
      CoreFMS_enumDef_S1_Execute : begin
        Reset = 1'b0;
      end
      CoreFMS_enumDef_S2_DMA : begin
      end
      CoreFMS_enumDef_S3_INT : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    Branch = 1'b0;
    if(when_Spinal1802_l275) begin
      Branch = 1'b1;
    end else begin
      if(when_Spinal1802_l277) begin
        Branch = (Q == 1'b1);
      end else begin
        if(when_Spinal1802_l279) begin
          Branch = (D == 8'h00);
        end else begin
          if(when_Spinal1802_l281) begin
            Branch = (DF == 1'b1);
          end else begin
            if(when_Spinal1802_l283) begin
              Branch = (Q == 1'b0);
            end else begin
              if(when_Spinal1802_l285) begin
                Branch = (D != 8'h00);
              end else begin
                if(when_Spinal1802_l287) begin
                  Branch = (DF == 1'b0);
                end else begin
                  if(when_Spinal1802_l289) begin
                    Branch = (IE == 1'b0);
                  end else begin
                    if(when_Spinal1802_l291) begin
                      Branch = (EF[N[1 : 0]] == 1'b1);
                    end else begin
                      if(when_Spinal1802_l293) begin
                        Branch = (EF[N[1 : 0]] == 1'b0);
                      end else begin
                        Branch = 1'b0;
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  assign Skip = (((((((((N == _zz_Skip) || (N == _zz_Skip_1)) || (N == 4'b0110)) || (N == 4'b0111)) || (N == 4'b1000)) || (N == 4'b1100)) || (N == 4'b1101)) || (N == 4'b1110)) || (N == 4'b1111));
  assign _zz_A = _zz__zz_A;
  assign _zz_1 = ({15'd0,1'b1} <<< RSel);
  assign _zz_2 = _zz_1[0];
  assign _zz_3 = _zz_1[1];
  assign _zz_4 = _zz_1[2];
  assign _zz_5 = _zz_1[3];
  assign _zz_6 = _zz_1[4];
  assign _zz_7 = _zz_1[5];
  assign _zz_8 = _zz_1[6];
  assign _zz_9 = _zz_1[7];
  assign _zz_10 = _zz_1[8];
  assign _zz_11 = _zz_1[9];
  assign _zz_12 = _zz_1[10];
  assign _zz_13 = _zz_1[11];
  assign _zz_14 = _zz_1[12];
  assign _zz_15 = _zz_1[13];
  assign _zz_16 = _zz_1[14];
  assign _zz_17 = _zz_1[15];
  assign A = _zz_A;
  assign io_Q = Q;
  assign io_SC = SC;
  assign io_N = outN;
  assign io_TPA = TPA;
  assign io_TPB = TPB;
  assign io_MRD = MRD;
  assign io_MWR = MWR;
  assign io_DataOut = Bus_1;
  assign io_Addr16 = Addr16;
  assign when_Spinal1802_l124 = (StartCounting && (Mode != CPUModes_Pause));
  assign when_Spinal1802_l129 = ((! io_Clear_n) && (! io_Wait_n));
  assign when_Spinal1802_l131 = ((! io_Clear_n) && io_Wait_n);
  assign when_Spinal1802_l133 = (io_Clear_n && (! io_Wait_n));
  assign when_Spinal1802_l138 = ((StateCounter_value == 3'b001) && (Mode != CPUModes_Reset));
  assign when_Spinal1802_l142 = ((StateCounter_value == 3'b110) && (Mode != CPUModes_Reset));
  assign when_Spinal1802_l147 = (RegSelMode == RegSelectModes_NSel);
  always @(*) begin
    if(when_Spinal1802_l147) begin
      RSel = N;
    end else begin
      if(when_Spinal1802_l149) begin
        RSel = X;
      end else begin
        if(when_Spinal1802_l151) begin
          RSel = 4'b0010;
        end else begin
          if(when_Spinal1802_l153) begin
            RSel = 4'b0000;
          end else begin
            RSel = P;
          end
        end
      end
    end
  end

  assign when_Spinal1802_l149 = (RegSelMode == RegSelectModes_XSel);
  assign when_Spinal1802_l151 = (RegSelMode == RegSelectModes_Stack2);
  assign when_Spinal1802_l153 = (RegSelMode == RegSelectModes_DMA0);
  assign _zz_R_0 = (A + 16'h0001);
  assign _zz_R_0_1 = (A - 16'h0001);
  assign _zz_R_0_2 = {Bus_1,_zz_A[7 : 0]};
  assign _zz_R_0_3 = {_zz_A[15 : 8],Bus_1};
  assign _zz_R_0_4 = {TmpUpper,Bus_1};
  assign when_Spinal1802_l160 = (RegOpMode == RegOperationModes_Inc);
  assign when_Spinal1802_l162 = (RegOpMode == RegOperationModes_Dec);
  assign when_Spinal1802_l164 = (RegOpMode == RegOperationModes_LoadUpper);
  assign when_Spinal1802_l166 = (RegOpMode == RegOperationModes_LoadLower);
  assign when_Spinal1802_l168 = (RegOpMode == RegOperationModes_LoadTemp);
  assign when_Spinal1802_l170 = (RegOpMode == RegOperationModes_LoadJump);
  assign when_Spinal1802_l177 = (StateCounter_value == 3'b000);
  assign when_Spinal1802_l181 = ((3'b001 <= StateCounter_value) && (StateCounter_value <= 3'b010));
  always @(*) begin
    if(when_Spinal1802_l181) begin
      io_Addr = Addr[15 : 8];
    end else begin
      io_Addr = Addr[7 : 0];
    end
  end

  assign when_Spinal1802_l186 = (3'b011 <= StateCounter_value);
  assign when_Spinal1802_l187 = (SC == 2'b00);
  assign when_Spinal1802_l189 = (((SC == 2'b01) || (SC == 2'b10)) && (((((((ExeMode == _zz_when_Spinal1802_l189) || (ExeMode == _zz_when_Spinal1802_l189_1)) || (ExeMode == ExecuteModes_LoadDec)) || (ExeMode == ExecuteModes_LoadNoInc)) || (ExeMode == ExecuteModes_LongLoad)) || (ExeMode == ExecuteModes_LongContinue)) || (ExeMode == ExecuteModes_DMA_Out)));
  assign when_Spinal1802_l199 = ((3'b101 <= StateCounter_value) && (StateCounter_value < 3'b111));
  assign when_Spinal1802_l203 = (((SC == 2'b01) || (SC == 2'b10)) && ((((ExeMode == ExecuteModes_Write) || (ExeMode == ExecuteModes_WriteDec)) || (ExeMode == ExecuteModes_WriteNoInc)) || (ExeMode == ExecuteModes_DMA_In)));
  assign ALU_Add = (_zz_ALU_Add + _zz_ALU_Add_1);
  assign ALU_AddCarry = (ALU_Add + {8'h00,DF});
  assign ALU_SubD = (_zz_ALU_SubD - _zz_ALU_SubD_1);
  assign ALU_SubM = (_zz_ALU_SubM - _zz_ALU_SubM_1);
  assign ALU_SubDB = (ALU_SubD - {8'h00,(! DF)});
  assign ALU_SubMB = (ALU_SubM - {8'h00,(! DF)});
  assign when_Spinal1802_l219 = (DRegControl == DRegControlModes_BusIn);
  assign when_Spinal1802_l221 = (DRegControl == DRegControlModes_ALU_OR);
  assign when_Spinal1802_l223 = (DRegControl == DRegControlModes_ALU_XOR);
  assign when_Spinal1802_l225 = (DRegControl == DRegControlModes_ALU_AND);
  assign when_Spinal1802_l227 = (DRegControl == DRegControlModes_ALU_RSH);
  assign when_Spinal1802_l230 = (DRegControl == DRegControlModes_ALU_RSHR);
  assign when_Spinal1802_l233 = (DRegControl == DRegControlModes_ALU_LSH);
  assign when_Spinal1802_l236 = (DRegControl == DRegControlModes_ALU_LSHR);
  assign when_Spinal1802_l239 = (DRegControl == DRegControlModes_ALU_Add);
  assign when_Spinal1802_l242 = (DRegControl == DRegControlModes_ALU_AddCarry);
  assign when_Spinal1802_l245 = (DRegControl == DRegControlModes_ALU_SubD);
  assign when_Spinal1802_l248 = (DRegControl == DRegControlModes_ALU_SubM);
  assign when_Spinal1802_l251 = (DRegControl == DRegControlModes_ALU_SubDBorrow);
  assign when_Spinal1802_l254 = (DRegControl == DRegControlModes_ALU_SubMBorrow);
  assign when_Spinal1802_l260 = (BusControl == BusControlModes_DataIn);
  always @(*) begin
    if(when_Spinal1802_l260) begin
      Bus_1 = io_DataIn;
    end else begin
      if(when_Spinal1802_l262) begin
        Bus_1 = D;
      end else begin
        if(when_Spinal1802_l264) begin
          Bus_1 = T;
        end else begin
          if(when_Spinal1802_l266) begin
            Bus_1 = {X,P};
          end else begin
            if(when_Spinal1802_l268) begin
              Bus_1 = A[7 : 0];
            end else begin
              if(when_Spinal1802_l270) begin
                Bus_1 = A[15 : 8];
              end else begin
                Bus_1 = 8'h00;
              end
            end
          end
        end
      end
    end
  end

  assign when_Spinal1802_l262 = (BusControl == BusControlModes_DReg);
  assign when_Spinal1802_l264 = (BusControl == BusControlModes_TReg);
  assign when_Spinal1802_l266 = (BusControl == BusControlModes_PXReg);
  assign when_Spinal1802_l268 = (BusControl == BusControlModes_RLower);
  assign when_Spinal1802_l270 = (BusControl == BusControlModes_RUpper);
  assign when_Spinal1802_l275 = ((N == 4'b0000) || (OP == 8'hc4));
  assign when_Spinal1802_l277 = (((N == 4'b0001) || (OP == 8'hc5)) || (OP == 8'hc1));
  assign when_Spinal1802_l279 = (((N == 4'b0010) || (OP == 8'hc6)) || (OP == 8'hc2));
  assign when_Spinal1802_l281 = (((N == 4'b0011) || (OP == 8'hc7)) || (OP == 8'hc3));
  assign when_Spinal1802_l283 = (((N == 4'b1001) || (OP == 8'hcd)) || (OP == 8'hc9));
  assign when_Spinal1802_l285 = (((N == 4'b1010) || (OP == 8'hce)) || (OP == 8'hca));
  assign when_Spinal1802_l287 = (((N == 4'b1011) || (OP == 8'hcf)) || (OP == 8'hcb));
  assign when_Spinal1802_l289 = (OP == 8'hcc);
  assign when_Spinal1802_l291 = ((I == 4'b0011) && ((((N == 4'b0100) || (N == 4'b0101)) || (N == 4'b0110)) || (N == 4'b0111)));
  assign when_Spinal1802_l293 = ((I == 4'b0011) && ((((N == 4'b1100) || (N == 4'b1101)) || (N == 4'b1110)) || (N == 4'b1111)));
  assign CoreFMS_wantExit = 1'b0;
  always @(*) begin
    CoreFMS_wantStart = 1'b0;
    case(CoreFMS_stateReg)
      CoreFMS_enumDef_S1_Reset : begin
      end
      CoreFMS_enumDef_S1_Init : begin
      end
      CoreFMS_enumDef_S0_Fetch : begin
      end
      CoreFMS_enumDef_S1_Execute : begin
      end
      CoreFMS_enumDef_S2_DMA : begin
      end
      CoreFMS_enumDef_S3_INT : begin
      end
      default : begin
        CoreFMS_wantStart = 1'b1;
      end
    endcase
  end

  assign CoreFMS_wantKill = 1'b0;
  always @(*) begin
    CoreFMS_stateNext = CoreFMS_stateReg;
    case(CoreFMS_stateReg)
      CoreFMS_enumDef_S1_Reset : begin
        if(when_Spinal1802_l304) begin
          CoreFMS_stateNext = CoreFMS_enumDef_S1_Init;
        end
      end
      CoreFMS_enumDef_S1_Init : begin
        if(when_State_l238) begin
          if(when_Spinal1802_l333) begin
            CoreFMS_stateNext = CoreFMS_enumDef_S1_Execute;
          end else begin
            CoreFMS_stateNext = CoreFMS_enumDef_S0_Fetch;
          end
        end
      end
      CoreFMS_enumDef_S0_Fetch : begin
        if(when_Spinal1802_l443) begin
          CoreFMS_stateNext = CoreFMS_enumDef_S1_Reset;
        end else begin
          if(StateCounter_willOverflow) begin
            CoreFMS_stateNext = CoreFMS_enumDef_S1_Execute;
          end
        end
      end
      CoreFMS_enumDef_S1_Execute : begin
        if(when_Spinal1802_l621) begin
          CoreFMS_stateNext = CoreFMS_enumDef_S1_Reset;
        end else begin
          if(StateCounter_willOverflow) begin
            if(when_Spinal1802_l625) begin
              CoreFMS_stateNext = CoreFMS_enumDef_S2_DMA;
            end else begin
              if(when_Spinal1802_l629) begin
                CoreFMS_stateNext = CoreFMS_enumDef_S2_DMA;
              end else begin
                if(when_Spinal1802_l633) begin
                  CoreFMS_stateNext = CoreFMS_enumDef_S3_INT;
                end else begin
                  if(!when_Spinal1802_l636) begin
                    if(when_Spinal1802_l639) begin
                      CoreFMS_stateNext = CoreFMS_enumDef_S0_Fetch;
                    end
                  end
                end
              end
            end
          end
        end
      end
      CoreFMS_enumDef_S2_DMA : begin
        if(when_Spinal1802_l663) begin
          CoreFMS_stateNext = CoreFMS_enumDef_S1_Reset;
        end else begin
          if(StateCounter_willOverflow) begin
            if(when_Spinal1802_l666) begin
              if(when_Spinal1802_l668) begin
                CoreFMS_stateNext = CoreFMS_enumDef_S1_Execute;
              end else begin
                CoreFMS_stateNext = CoreFMS_enumDef_S0_Fetch;
              end
            end
          end
        end
      end
      CoreFMS_enumDef_S3_INT : begin
        if(when_Spinal1802_l693) begin
          CoreFMS_stateNext = CoreFMS_enumDef_S1_Reset;
        end else begin
          if(StateCounter_willOverflow) begin
            if(when_Spinal1802_l697) begin
              CoreFMS_stateNext = CoreFMS_enumDef_S2_DMA;
            end else begin
              if(when_Spinal1802_l700) begin
                CoreFMS_stateNext = CoreFMS_enumDef_S2_DMA;
              end else begin
                CoreFMS_stateNext = CoreFMS_enumDef_S0_Fetch;
              end
            end
          end
        end
      end
      default : begin
      end
    endcase
    if(CoreFMS_wantStart) begin
      CoreFMS_stateNext = CoreFMS_enumDef_S1_Reset;
    end
    if(CoreFMS_wantKill) begin
      CoreFMS_stateNext = CoreFMS_enumDef_BOOT;
    end
  end

  assign when_Spinal1802_l304 = (Mode != CPUModes_Reset);
  assign when_State_l238 = (_zz_when_State_l238 <= 4'b0001);
  assign when_Spinal1802_l333 = (Mode == CPUModes_Load);
  assign when_Spinal1802_l344 = (StateCounter_value == 3'b000);
  assign when_Spinal1802_l349 = (StateCounter_value == 3'b001);
  assign when_Spinal1802_l352 = (StateCounter_value == 3'b010);
  assign when_Spinal1802_l355 = (StateCounter_value == 3'b110);
  assign when_Spinal1802_l360 = (StateCounter_value == 3'b111);
  assign when_Spinal1802_l363 = (N == 4'b0000);
  assign when_Spinal1802_l367 = (4'b0001 <= N);
  assign when_Spinal1802_l391 = ((4'b0000 < N) && (N <= 4'b0111));
  assign when_Spinal1802_l393 = (4'b1001 <= N);
  assign when_Spinal1802_l398 = (((N == 4'b0000) || (N == 4'b0001)) || (N == 4'b0010));
  assign when_Spinal1802_l401 = (N == 4'b0011);
  assign when_Spinal1802_l404 = (((N == 4'b0100) || (N == 4'b0101)) || (N == 4'b0111));
  assign when_Spinal1802_l407 = (N == 4'b1000);
  assign when_Spinal1802_l410 = (N == 4'b1001);
  assign when_Spinal1802_l414 = (((N == 4'b1100) || (N == 4'b1101)) || (N == 4'b1111));
  assign when_Spinal1802_l434 = ((N <= 4'b0101) || (N == 4'b0111));
  assign when_Spinal1802_l437 = (((4'b1000 <= N) && (N <= 4'b1101)) || (N == 4'b1111));
  assign when_Spinal1802_l443 = (Mode == CPUModes_Reset);
  assign when_Spinal1802_l456 = (StateCounter_value == 3'b001);
  assign when_Spinal1802_l458 = (((ExeMode == ExecuteModes_Load) || (ExeMode == ExecuteModes_Write)) || (ExeMode == ExecuteModes_LongLoad));
  assign when_Spinal1802_l460 = (((ExeMode == ExecuteModes_LoadDec) || (ExeMode == ExecuteModes_WriteDec)) || (ExeMode == ExecuteModes_LongContinue));
  assign when_Spinal1802_l464 = ((I == 4'b0110) && (4'b0000 < N));
  assign when_Spinal1802_l469 = (StateCounter_value == 3'b010);
  assign when_Spinal1802_l473 = (StateCounter_value == 3'b100);
  assign when_Spinal1802_l479 = ((N == 4'b1000) || (N == 4'b1001));
  assign when_Spinal1802_l481 = (N == 4'b0011);
  assign when_Spinal1802_l488 = (StateCounter_value == 3'b101);
  assign when_Spinal1802_l491 = (N != 4'b0000);
  assign when_Spinal1802_l506 = (N == 4'b0000);
  assign when_Spinal1802_l508 = (4'b1001 <= N);
  assign when_Spinal1802_l513 = ((N == 4'b0000) || (N == 4'b0001));
  assign when_Spinal1802_l517 = (N == 4'b0010);
  assign when_Spinal1802_l519 = ((N == 4'b0100) || (N == 4'b1100));
  assign when_Spinal1802_l521 = ((N == 4'b0101) || (N == 4'b1101));
  assign when_Spinal1802_l523 = (N == 4'b0110);
  assign when_Spinal1802_l525 = ((N == 4'b0111) || (N == 4'b1111));
  assign when_Spinal1802_l527 = (N == 4'b1010);
  assign when_Spinal1802_l529 = (N == 4'b1011);
  assign when_Spinal1802_l531 = (N == 4'b1110);
  assign when_Spinal1802_l554 = (ExeMode == ExecuteModes_Load);
  assign when_Spinal1802_l555 = (Branch && (! Skip));
  assign when_Spinal1802_l558 = (((ExeMode == ExecuteModes_LongLoad) && Branch) && (! Skip));
  assign when_Spinal1802_l572 = (N == 4'b0000);
  assign when_Spinal1802_l574 = ((N == 4'b0001) || (N == 4'b1001));
  assign when_Spinal1802_l576 = ((N == 4'b0010) || (N == 4'b1010));
  assign when_Spinal1802_l578 = ((N == 4'b0011) || (N == 4'b1011));
  assign when_Spinal1802_l580 = ((N == 4'b0100) || (N == 4'b1100));
  assign when_Spinal1802_l582 = ((N == 4'b0101) || (N == 4'b1101));
  assign when_Spinal1802_l584 = (N == 4'b0110);
  assign when_Spinal1802_l586 = ((N == 4'b0111) || (N == 4'b1111));
  assign when_Spinal1802_l588 = (N == 4'b1000);
  assign when_Spinal1802_l590 = (N == 4'b1110);
  assign when_Spinal1802_l597 = (StateCounter_value == 3'b110);
  assign when_Spinal1802_l598 = ((I == 4'b0111) && (N == 4'b1001));
  assign when_Spinal1802_l602 = ((ExeMode == ExecuteModes_LongLoad) || (ExeMode == ExecuteModes_LongContinue));
  assign when_Spinal1802_l604 = ((I == 4'b1100) && ((RegOpMode == RegOperationModes_LoadTemp) || (Skip && (! Branch))));
  assign when_Spinal1802_l606 = (((I == 4'b1100) && Skip) && Branch);
  assign when_Spinal1802_l608 = (((I == 4'b1100) && (! Skip)) && (! Branch));
  assign when_Spinal1802_l621 = (Mode == CPUModes_Reset);
  assign when_Spinal1802_l625 = (! io_DMA_In_n);
  assign when_Spinal1802_l639 = ((! ((ExeMode == ExecuteModes_LongLoad) || (ExeMode == ExecuteModes_LongContinue))) && (! Idle));
  assign when_Spinal1802_l629 = (! io_DMA_Out_n);
  assign when_Spinal1802_l633 = (((! io_Interrupt_n) && IE) && (! ((ExeMode == ExecuteModes_LongLoad) || (ExeMode == ExecuteModes_LongContinue))));
  assign when_Spinal1802_l636 = (Mode == CPUModes_Load);
  assign when_Spinal1802_l651 = (StateCounter_value == 3'b000);
  assign when_Spinal1802_l656 = (StateCounter_value == 3'b001);
  assign when_Spinal1802_l660 = (StateCounter_value == 3'b010);
  assign when_Spinal1802_l663 = (Mode == CPUModes_Reset);
  assign when_Spinal1802_l666 = (io_DMA_In_n && io_DMA_Out_n);
  assign when_Spinal1802_l668 = (Mode == CPUModes_Load);
  assign when_Spinal1802_l684 = (StateCounter_value == 3'b010);
  assign when_Spinal1802_l688 = (StateCounter_value == 3'b011);
  assign when_Spinal1802_l693 = (Mode == CPUModes_Reset);
  assign when_Spinal1802_l697 = (! io_DMA_In_n);
  assign when_Spinal1802_l700 = (! io_DMA_Out_n);
  assign when_StateMachine_l253 = ((! (CoreFMS_stateReg == CoreFMS_enumDef_S1_Init)) && (CoreFMS_stateNext == CoreFMS_enumDef_S1_Init));
  always @(posedge Core17_clk) begin
    if(_zz_18) begin
      if(Core17_reset) begin
      Q <= 1'b0;
      TPA <= 1'b0;
      TPB <= 1'b0;
      MRD <= 1'b1;
      MWR <= 1'b1;
      StateCounter_value <= 3'b000;
      StartCounting <= 1'b0;
      Addr <= 16'h0000;
      Addr16 <= 16'h0000;
      D <= 8'h00;
      outN <= 3'b000;
      T <= 8'h00;
      IE <= 1'b1;
      DF <= 1'b0;
      Idle <= 1'b0;
      CoreFMS_stateReg <= CoreFMS_enumDef_BOOT;
      end else begin
        StateCounter_value <= StateCounter_valueNext;
        Addr16 <= Addr;
        if(when_Spinal1802_l138) begin
          TPA <= 1'b1;
        end else begin
          TPA <= 1'b0;
        end
        if(when_Spinal1802_l142) begin
          TPB <= 1'b1;
        end else begin
          TPB <= 1'b0;
        end
        if(Reset) begin
          Addr <= 16'h0000;
        end else begin
          if(when_Spinal1802_l177) begin
            Addr <= A;
          end
        end
        if(when_Spinal1802_l186) begin
          if(when_Spinal1802_l187) begin
            MRD <= 1'b0;
          end else begin
            if(when_Spinal1802_l189) begin
              MRD <= 1'b0;
            end
          end
        end else begin
          MRD <= 1'b1;
        end
        if(when_Spinal1802_l199) begin
          if(when_Spinal1802_l203) begin
            MWR <= 1'b0;
          end
        end else begin
          MWR <= 1'b1;
        end
        if(Reset) begin
          DF <= 1'b0;
          D <= 8'h00;
        end else begin
          if(when_Spinal1802_l219) begin
            D <= Bus_1;
          end else begin
            if(when_Spinal1802_l221) begin
              D <= (Bus_1 | D);
            end else begin
              if(when_Spinal1802_l223) begin
                D <= (Bus_1 ^ D);
              end else begin
                if(when_Spinal1802_l225) begin
                  D <= (Bus_1 & D);
                end else begin
                  if(when_Spinal1802_l227) begin
                    DF <= Dlast[0];
                    D <= (D >>> 1);
                  end else begin
                    if(when_Spinal1802_l230) begin
                      DF <= Dlast[0];
                      D <= (_zz_D | {DFLast,7'h00});
                    end else begin
                      if(when_Spinal1802_l233) begin
                        DF <= Dlast[7];
                        D <= (D <<< 1);
                      end else begin
                        if(when_Spinal1802_l236) begin
                          DF <= Dlast[7];
                          D <= (_zz_D_1 | {7'h00,DFLast});
                        end else begin
                          if(when_Spinal1802_l239) begin
                            DF <= ALU_Add[8];
                            D <= ALU_Add[7:0];
                          end else begin
                            if(when_Spinal1802_l242) begin
                              DF <= ALU_AddCarry[8];
                              D <= ALU_AddCarry[7:0];
                            end else begin
                              if(when_Spinal1802_l245) begin
                                DF <= (! ALU_SubD[8]);
                                D <= ALU_SubD[7:0];
                              end else begin
                                if(when_Spinal1802_l248) begin
                                  DF <= (! ALU_SubM[8]);
                                  D <= ALU_SubM[7:0];
                                end else begin
                                  if(when_Spinal1802_l251) begin
                                    DF <= (! ALU_SubDB[8]);
                                    D <= ALU_SubDB[7:0];
                                  end else begin
                                    if(when_Spinal1802_l254) begin
                                      DF <= (! ALU_SubMB[8]);
                                      D <= ALU_SubMB[7:0];
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        CoreFMS_stateReg <= CoreFMS_stateNext;
        case(CoreFMS_stateReg)
          CoreFMS_enumDef_S1_Reset : begin
          end
          CoreFMS_enumDef_S1_Init : begin
            Idle <= 1'b0;
            IE <= 1'b1;
            outN <= 3'b000;
            T <= 8'h00;
            Q <= 1'b0;
            if(when_State_l238) begin
              StartCounting <= 1'b1;
            end
          end
          CoreFMS_enumDef_S0_Fetch : begin
            if(when_Spinal1802_l360) begin
              case(I)
                4'b0000 : begin
                  if(when_Spinal1802_l363) begin
                    Idle <= 1'b1;
                  end
                end
                4'b0111 : begin
                  if(!when_Spinal1802_l398) begin
                    if(!when_Spinal1802_l401) begin
                      if(!when_Spinal1802_l404) begin
                        if(!when_Spinal1802_l407) begin
                          if(when_Spinal1802_l410) begin
                            T <= {X,P};
                          end
                        end
                      end
                    end
                  end
                end
                default : begin
                end
              endcase
            end
          end
          CoreFMS_enumDef_S1_Execute : begin
            if(when_Spinal1802_l456) begin
              if(when_Spinal1802_l464) begin
                outN <= N[2:0];
              end
            end
            if(when_Spinal1802_l488) begin
              case(I)
                4'b0111 : begin
                  if(when_Spinal1802_l513) begin
                    IE <= (! N[0]);
                  end else begin
                    if(!when_Spinal1802_l517) begin
                      if(!when_Spinal1802_l519) begin
                        if(!when_Spinal1802_l521) begin
                          if(!when_Spinal1802_l523) begin
                            if(!when_Spinal1802_l525) begin
                              if(when_Spinal1802_l527) begin
                                Q <= 1'b0;
                              end else begin
                                if(when_Spinal1802_l529) begin
                                  Q <= 1'b1;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
                default : begin
                end
              endcase
            end
            if(!when_Spinal1802_l621) begin
              if(StateCounter_willOverflow) begin
                outN <= 3'b000;
              end
            end
          end
          CoreFMS_enumDef_S2_DMA : begin
            if(!when_Spinal1802_l663) begin
              if(StateCounter_willOverflow) begin
                if(when_Spinal1802_l666) begin
                  if(!when_Spinal1802_l668) begin
                    Idle <= 1'b0;
                  end
                end
              end
            end
          end
          CoreFMS_enumDef_S3_INT : begin
            if(when_Spinal1802_l684) begin
              T <= {X,P};
            end
            if(when_Spinal1802_l688) begin
              IE <= 1'b0;
            end
            if(!when_Spinal1802_l693) begin
              if(StateCounter_willOverflow) begin
                Idle <= 1'b0;
              end
            end
          end
          default : begin
          end
        endcase
      end
    end
  end

  always @(posedge Core17_clk) begin
    if(_zz_18) begin
      Dlast <= D;
      EF <= (~ io_EF_n);
      DFLast <= DF;
      OP <= {I,N};
      if(when_Spinal1802_l129) begin
        Mode <= CPUModes_Load;
      end else begin
        if(when_Spinal1802_l131) begin
          Mode <= CPUModes_Reset;
        end else begin
          if(when_Spinal1802_l133) begin
            Mode <= CPUModes_Pause;
          end else begin
            Mode <= CPUModes_Run;
          end
        end
      end
      if(Reset) begin
        R_0 <= 16'h0000;
      end else begin
        if(when_Spinal1802_l160) begin
          if(_zz_2) begin
            R_0 <= _zz_R_0;
          end
          if(_zz_3) begin
            R_1 <= _zz_R_0;
          end
          if(_zz_4) begin
            R_2 <= _zz_R_0;
          end
          if(_zz_5) begin
            R_3 <= _zz_R_0;
          end
          if(_zz_6) begin
            R_4 <= _zz_R_0;
          end
          if(_zz_7) begin
            R_5 <= _zz_R_0;
          end
          if(_zz_8) begin
            R_6 <= _zz_R_0;
          end
          if(_zz_9) begin
            R_7 <= _zz_R_0;
          end
          if(_zz_10) begin
            R_8 <= _zz_R_0;
          end
          if(_zz_11) begin
            R_9 <= _zz_R_0;
          end
          if(_zz_12) begin
            R_10 <= _zz_R_0;
          end
          if(_zz_13) begin
            R_11 <= _zz_R_0;
          end
          if(_zz_14) begin
            R_12 <= _zz_R_0;
          end
          if(_zz_15) begin
            R_13 <= _zz_R_0;
          end
          if(_zz_16) begin
            R_14 <= _zz_R_0;
          end
          if(_zz_17) begin
            R_15 <= _zz_R_0;
          end
        end else begin
          if(when_Spinal1802_l162) begin
            if(_zz_2) begin
              R_0 <= _zz_R_0_1;
            end
            if(_zz_3) begin
              R_1 <= _zz_R_0_1;
            end
            if(_zz_4) begin
              R_2 <= _zz_R_0_1;
            end
            if(_zz_5) begin
              R_3 <= _zz_R_0_1;
            end
            if(_zz_6) begin
              R_4 <= _zz_R_0_1;
            end
            if(_zz_7) begin
              R_5 <= _zz_R_0_1;
            end
            if(_zz_8) begin
              R_6 <= _zz_R_0_1;
            end
            if(_zz_9) begin
              R_7 <= _zz_R_0_1;
            end
            if(_zz_10) begin
              R_8 <= _zz_R_0_1;
            end
            if(_zz_11) begin
              R_9 <= _zz_R_0_1;
            end
            if(_zz_12) begin
              R_10 <= _zz_R_0_1;
            end
            if(_zz_13) begin
              R_11 <= _zz_R_0_1;
            end
            if(_zz_14) begin
              R_12 <= _zz_R_0_1;
            end
            if(_zz_15) begin
              R_13 <= _zz_R_0_1;
            end
            if(_zz_16) begin
              R_14 <= _zz_R_0_1;
            end
            if(_zz_17) begin
              R_15 <= _zz_R_0_1;
            end
          end else begin
            if(when_Spinal1802_l164) begin
              if(_zz_2) begin
                R_0 <= _zz_R_0_2;
              end
              if(_zz_3) begin
                R_1 <= _zz_R_0_2;
              end
              if(_zz_4) begin
                R_2 <= _zz_R_0_2;
              end
              if(_zz_5) begin
                R_3 <= _zz_R_0_2;
              end
              if(_zz_6) begin
                R_4 <= _zz_R_0_2;
              end
              if(_zz_7) begin
                R_5 <= _zz_R_0_2;
              end
              if(_zz_8) begin
                R_6 <= _zz_R_0_2;
              end
              if(_zz_9) begin
                R_7 <= _zz_R_0_2;
              end
              if(_zz_10) begin
                R_8 <= _zz_R_0_2;
              end
              if(_zz_11) begin
                R_9 <= _zz_R_0_2;
              end
              if(_zz_12) begin
                R_10 <= _zz_R_0_2;
              end
              if(_zz_13) begin
                R_11 <= _zz_R_0_2;
              end
              if(_zz_14) begin
                R_12 <= _zz_R_0_2;
              end
              if(_zz_15) begin
                R_13 <= _zz_R_0_2;
              end
              if(_zz_16) begin
                R_14 <= _zz_R_0_2;
              end
              if(_zz_17) begin
                R_15 <= _zz_R_0_2;
              end
            end else begin
              if(when_Spinal1802_l166) begin
                if(_zz_2) begin
                  R_0 <= _zz_R_0_3;
                end
                if(_zz_3) begin
                  R_1 <= _zz_R_0_3;
                end
                if(_zz_4) begin
                  R_2 <= _zz_R_0_3;
                end
                if(_zz_5) begin
                  R_3 <= _zz_R_0_3;
                end
                if(_zz_6) begin
                  R_4 <= _zz_R_0_3;
                end
                if(_zz_7) begin
                  R_5 <= _zz_R_0_3;
                end
                if(_zz_8) begin
                  R_6 <= _zz_R_0_3;
                end
                if(_zz_9) begin
                  R_7 <= _zz_R_0_3;
                end
                if(_zz_10) begin
                  R_8 <= _zz_R_0_3;
                end
                if(_zz_11) begin
                  R_9 <= _zz_R_0_3;
                end
                if(_zz_12) begin
                  R_10 <= _zz_R_0_3;
                end
                if(_zz_13) begin
                  R_11 <= _zz_R_0_3;
                end
                if(_zz_14) begin
                  R_12 <= _zz_R_0_3;
                end
                if(_zz_15) begin
                  R_13 <= _zz_R_0_3;
                end
                if(_zz_16) begin
                  R_14 <= _zz_R_0_3;
                end
                if(_zz_17) begin
                  R_15 <= _zz_R_0_3;
                end
              end else begin
                if(when_Spinal1802_l168) begin
                  TmpUpper <= Bus_1;
                end else begin
                  if(when_Spinal1802_l170) begin
                    if(_zz_2) begin
                      R_0 <= _zz_R_0_4;
                    end
                    if(_zz_3) begin
                      R_1 <= _zz_R_0_4;
                    end
                    if(_zz_4) begin
                      R_2 <= _zz_R_0_4;
                    end
                    if(_zz_5) begin
                      R_3 <= _zz_R_0_4;
                    end
                    if(_zz_6) begin
                      R_4 <= _zz_R_0_4;
                    end
                    if(_zz_7) begin
                      R_5 <= _zz_R_0_4;
                    end
                    if(_zz_8) begin
                      R_6 <= _zz_R_0_4;
                    end
                    if(_zz_9) begin
                      R_7 <= _zz_R_0_4;
                    end
                    if(_zz_10) begin
                      R_8 <= _zz_R_0_4;
                    end
                    if(_zz_11) begin
                      R_9 <= _zz_R_0_4;
                    end
                    if(_zz_12) begin
                      R_10 <= _zz_R_0_4;
                    end
                    if(_zz_13) begin
                      R_11 <= _zz_R_0_4;
                    end
                    if(_zz_14) begin
                      R_12 <= _zz_R_0_4;
                    end
                    if(_zz_15) begin
                      R_13 <= _zz_R_0_4;
                    end
                    if(_zz_16) begin
                      R_14 <= _zz_R_0_4;
                    end
                    if(_zz_17) begin
                      R_15 <= _zz_R_0_4;
                    end
                  end
                end
              end
            end
          end
        end
      end
      case(CoreFMS_stateReg)
        CoreFMS_enumDef_S1_Reset : begin
          SC <= 2'b01;
        end
        CoreFMS_enumDef_S1_Init : begin
          ExeMode <= ExecuteModes_None;
          RegSelMode <= RegSelectModes_PSel;
          RegOpMode <= RegOperationModes_None;
          DRegControl <= DRegControlModes_None;
          BusControl <= BusControlModes_DataIn;
          P <= 4'b0000;
          X <= 4'b0000;
          I <= 4'b0000;
          N <= 4'b0000;
          SC <= 2'b01;
          _zz_when_State_l238 <= (_zz_when_State_l238 - 4'b0001);
        end
        CoreFMS_enumDef_S0_Fetch : begin
          SC <= 2'b00;
          if(when_Spinal1802_l344) begin
            ExeMode <= ExecuteModes_None;
            BusControl <= BusControlModes_DataIn;
            RegSelMode <= RegSelectModes_PSel;
          end
          if(when_Spinal1802_l349) begin
            RegOpMode <= RegOperationModes_Inc;
          end
          if(when_Spinal1802_l352) begin
            RegOpMode <= RegOperationModes_None;
          end
          if(when_Spinal1802_l355) begin
            I <= io_DataIn[7 : 4];
            N <= io_DataIn[3 : 0];
          end
          if(when_Spinal1802_l360) begin
            case(I)
              4'b0000 : begin
                if(when_Spinal1802_l363) begin
                  ExeMode <= ExecuteModes_LoadNoInc;
                  RegSelMode <= RegSelectModes_DMA0;
                end else begin
                  if(when_Spinal1802_l367) begin
                    ExeMode <= ExecuteModes_LoadNoInc;
                    RegSelMode <= RegSelectModes_NSel;
                  end
                end
              end
              4'b0001 : begin
                RegSelMode <= RegSelectModes_NSel;
              end
              4'b0010 : begin
                RegSelMode <= RegSelectModes_NSel;
              end
              4'b0011 : begin
                ExeMode <= ExecuteModes_Load;
              end
              4'b0100 : begin
                ExeMode <= ExecuteModes_Load;
                RegSelMode <= RegSelectModes_NSel;
              end
              4'b0101 : begin
                ExeMode <= ExecuteModes_WriteNoInc;
                RegSelMode <= RegSelectModes_NSel;
              end
              4'b0110 : begin
                RegSelMode <= RegSelectModes_XSel;
                if(when_Spinal1802_l391) begin
                  ExeMode <= ExecuteModes_Load;
                end else begin
                  if(when_Spinal1802_l393) begin
                    ExeMode <= ExecuteModes_WriteNoInc;
                  end
                end
              end
              4'b0111 : begin
                if(when_Spinal1802_l398) begin
                  RegSelMode <= RegSelectModes_XSel;
                  ExeMode <= ExecuteModes_Load;
                end else begin
                  if(when_Spinal1802_l401) begin
                    RegSelMode <= RegSelectModes_XSel;
                    ExeMode <= ExecuteModes_WriteDec;
                  end else begin
                    if(when_Spinal1802_l404) begin
                      RegSelMode <= RegSelectModes_XSel;
                      ExeMode <= ExecuteModes_LoadNoInc;
                    end else begin
                      if(when_Spinal1802_l407) begin
                        RegSelMode <= RegSelectModes_XSel;
                        ExeMode <= ExecuteModes_WriteNoInc;
                      end else begin
                        if(when_Spinal1802_l410) begin
                          RegSelMode <= RegSelectModes_Stack2;
                          ExeMode <= ExecuteModes_WriteDec;
                        end else begin
                          if(when_Spinal1802_l414) begin
                            ExeMode <= ExecuteModes_Load;
                          end
                        end
                      end
                    end
                  end
                end
              end
              4'b1000 : begin
                RegSelMode <= RegSelectModes_NSel;
              end
              4'b1001 : begin
                RegSelMode <= RegSelectModes_NSel;
              end
              4'b1010 : begin
                RegSelMode <= RegSelectModes_NSel;
              end
              4'b1011 : begin
                RegSelMode <= RegSelectModes_NSel;
              end
              4'b1100 : begin
                ExeMode <= ExecuteModes_Load;
              end
              4'b1111 : begin
                if(when_Spinal1802_l434) begin
                  RegSelMode <= RegSelectModes_XSel;
                  ExeMode <= ExecuteModes_LoadNoInc;
                end else begin
                  if(when_Spinal1802_l437) begin
                    ExeMode <= ExecuteModes_Load;
                  end
                end
              end
              default : begin
              end
            endcase
          end
        end
        CoreFMS_enumDef_S1_Execute : begin
          SC <= 2'b01;
          if(when_Spinal1802_l456) begin
            if(when_Spinal1802_l458) begin
              RegOpMode <= RegOperationModes_Inc;
            end else begin
              if(when_Spinal1802_l460) begin
                RegOpMode <= RegOperationModes_Dec;
              end
            end
          end
          if(when_Spinal1802_l469) begin
            RegOpMode <= RegOperationModes_None;
          end
          if(when_Spinal1802_l473) begin
            case(I)
              4'b0101 : begin
                BusControl <= BusControlModes_DReg;
              end
              4'b0111 : begin
                if(when_Spinal1802_l479) begin
                  BusControl <= BusControlModes_TReg;
                end else begin
                  if(when_Spinal1802_l481) begin
                    BusControl <= BusControlModes_DReg;
                  end
                end
              end
              default : begin
              end
            endcase
          end
          if(when_Spinal1802_l488) begin
            case(I)
              4'b0000 : begin
                if(when_Spinal1802_l491) begin
                  DRegControl <= DRegControlModes_BusIn;
                end
              end
              4'b0001 : begin
                RegOpMode <= RegOperationModes_Inc;
              end
              4'b0010 : begin
                RegOpMode <= RegOperationModes_Dec;
              end
              4'b0011 : begin
                if(Branch) begin
                  RegOpMode <= RegOperationModes_LoadLower;
                end
              end
              4'b0100 : begin
                DRegControl <= DRegControlModes_BusIn;
              end
              4'b0110 : begin
                if(when_Spinal1802_l506) begin
                  RegOpMode <= RegOperationModes_Inc;
                end else begin
                  if(when_Spinal1802_l508) begin
                    DRegControl <= DRegControlModes_BusIn;
                  end
                end
              end
              4'b0111 : begin
                if(when_Spinal1802_l513) begin
                  X <= Bus_1[7 : 4];
                  P <= Bus_1[3 : 0];
                end else begin
                  if(when_Spinal1802_l517) begin
                    DRegControl <= DRegControlModes_BusIn;
                  end else begin
                    if(when_Spinal1802_l519) begin
                      DRegControl <= DRegControlModes_ALU_AddCarry;
                    end else begin
                      if(when_Spinal1802_l521) begin
                        DRegControl <= DRegControlModes_ALU_SubDBorrow;
                      end else begin
                        if(when_Spinal1802_l523) begin
                          DRegControl <= DRegControlModes_ALU_RSHR;
                        end else begin
                          if(when_Spinal1802_l525) begin
                            DRegControl <= DRegControlModes_ALU_SubMBorrow;
                          end else begin
                            if(!when_Spinal1802_l527) begin
                              if(!when_Spinal1802_l529) begin
                                if(when_Spinal1802_l531) begin
                                  DRegControl <= DRegControlModes_ALU_LSHR;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
              4'b1000 : begin
                BusControl <= BusControlModes_RLower;
                DRegControl <= DRegControlModes_BusIn;
              end
              4'b1001 : begin
                BusControl <= BusControlModes_RUpper;
                DRegControl <= DRegControlModes_BusIn;
              end
              4'b1010 : begin
                BusControl <= BusControlModes_DReg;
                RegOpMode <= RegOperationModes_LoadLower;
              end
              4'b1011 : begin
                BusControl <= BusControlModes_DReg;
                RegOpMode <= RegOperationModes_LoadUpper;
              end
              4'b1100 : begin
                if(when_Spinal1802_l554) begin
                  if(when_Spinal1802_l555) begin
                    RegOpMode <= RegOperationModes_LoadTemp;
                  end
                end else begin
                  if(when_Spinal1802_l558) begin
                    RegOpMode <= RegOperationModes_LoadJump;
                  end
                end
              end
              4'b1101 : begin
                P <= N;
              end
              4'b1110 : begin
                X <= N;
              end
              4'b1111 : begin
                if(when_Spinal1802_l572) begin
                  DRegControl <= DRegControlModes_BusIn;
                end else begin
                  if(when_Spinal1802_l574) begin
                    DRegControl <= DRegControlModes_ALU_OR;
                  end else begin
                    if(when_Spinal1802_l576) begin
                      DRegControl <= DRegControlModes_ALU_AND;
                    end else begin
                      if(when_Spinal1802_l578) begin
                        DRegControl <= DRegControlModes_ALU_XOR;
                      end else begin
                        if(when_Spinal1802_l580) begin
                          DRegControl <= DRegControlModes_ALU_Add;
                        end else begin
                          if(when_Spinal1802_l582) begin
                            DRegControl <= DRegControlModes_ALU_SubD;
                          end else begin
                            if(when_Spinal1802_l584) begin
                              DRegControl <= DRegControlModes_ALU_RSH;
                            end else begin
                              if(when_Spinal1802_l586) begin
                                DRegControl <= DRegControlModes_ALU_SubM;
                              end else begin
                                if(when_Spinal1802_l588) begin
                                  DRegControl <= DRegControlModes_BusIn;
                                end else begin
                                  if(when_Spinal1802_l590) begin
                                    DRegControl <= DRegControlModes_ALU_LSH;
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
              default : begin
              end
            endcase
          end
          if(when_Spinal1802_l597) begin
            if(when_Spinal1802_l598) begin
              X <= P;
            end
            if(when_Spinal1802_l602) begin
              ExeMode <= ExecuteModes_None;
            end else begin
              if(when_Spinal1802_l604) begin
                ExeMode <= ExecuteModes_LongLoad;
              end else begin
                if(when_Spinal1802_l606) begin
                  ExeMode <= ExecuteModes_LongContinue;
                end else begin
                  if(when_Spinal1802_l608) begin
                    ExeMode <= ExecuteModes_LongLoad;
                  end
                end
              end
            end
            if(Idle) begin
              RegSelMode <= RegSelectModes_DMA0;
            end else begin
              RegSelMode <= RegSelectModes_PSel;
              RegOpMode <= RegOperationModes_None;
              DRegControl <= DRegControlModes_None;
            end
          end
          if(!when_Spinal1802_l621) begin
            if(StateCounter_willOverflow) begin
              if(when_Spinal1802_l625) begin
                RegSelMode <= RegSelectModes_DMA0;
                ExeMode <= ExecuteModes_DMA_In;
              end else begin
                if(when_Spinal1802_l629) begin
                  RegSelMode <= RegSelectModes_DMA0;
                  ExeMode <= ExecuteModes_DMA_Out;
                end else begin
                  if(when_Spinal1802_l633) begin
                    ExeMode <= ExecuteModes_None;
                  end else begin
                    if(when_Spinal1802_l636) begin
                      ExeMode <= ExecuteModes_None;
                    end
                  end
                end
              end
            end
          end
        end
        CoreFMS_enumDef_S2_DMA : begin
          SC <= 2'b10;
          if(when_Spinal1802_l651) begin
            BusControl <= BusControlModes_DataIn;
            RegSelMode <= RegSelectModes_DMA0;
          end
          if(when_Spinal1802_l656) begin
            RegOpMode <= RegOperationModes_Inc;
          end
          if(when_Spinal1802_l660) begin
            RegOpMode <= RegOperationModes_None;
          end
          if(!when_Spinal1802_l663) begin
            if(StateCounter_willOverflow) begin
              if(when_Spinal1802_l666) begin
                ExeMode <= ExecuteModes_None;
                if(!when_Spinal1802_l668) begin
                  RegSelMode <= RegSelectModes_PSel;
                end
              end
            end
          end
        end
        CoreFMS_enumDef_S3_INT : begin
          SC <= 2'b11;
          if(when_Spinal1802_l688) begin
            P <= 4'b0001;
            X <= 4'b0010;
          end
          if(!when_Spinal1802_l693) begin
            if(StateCounter_willOverflow) begin
              if(when_Spinal1802_l697) begin
                ExeMode <= ExecuteModes_DMA_In;
              end else begin
                if(when_Spinal1802_l700) begin
                  ExeMode <= ExecuteModes_DMA_Out;
                end else begin
                  RegSelMode <= RegSelectModes_PSel;
                end
              end
            end
          end
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l253) begin
        _zz_when_State_l238 <= 4'b1001;
      end
    end
  end


endmodule

module StreamFifo (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [7:0]    io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [7:0]    io_pop_payload,
  input  wire          io_flush,
  output wire [10:0]   io_occupancy,
  output wire [10:0]   io_availability,
  input  wire          Core48_clk,
  input  wire          Core48_reset
);

  reg        [7:0]    _zz_logic_ram_port1;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [10:0]   logic_ptr_push;
  reg        [10:0]   logic_ptr_pop;
  wire       [10:0]   logic_ptr_occupancy;
  wire       [10:0]   logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [9:0]    logic_push_onRam_write_payload_address;
  wire       [7:0]    logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [9:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [9:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [9:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [9:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [7:0]    logic_pop_sync_readPort_rsp;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [7:0]    logic_pop_sync_readArbitation_translated_payload;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [10:0]   logic_pop_sync_popReg;
  reg [7:0] logic_ram [0:1023];

  always @(posedge Core48_clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= logic_push_onRam_write_payload_data;
    end
  end

  always @(posedge Core48_clk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 11'h400) == 11'h000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[9:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[9:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign logic_pop_sync_readPort_rsp = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload = logic_pop_sync_readPort_rsp;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload = logic_pop_sync_readArbitation_translated_payload;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (11'h400 - logic_ptr_occupancy);
  always @(posedge Core48_clk) begin
    if(Core48_reset) begin
      logic_ptr_push <= 11'h000;
      logic_ptr_pop <= 11'h000;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 11'h000;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 11'h001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 11'h001);
      end
      if(io_flush) begin
        logic_ptr_push <= 11'h000;
        logic_ptr_pop <= 11'h000;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 11'h000;
      end
    end
  end

  always @(posedge Core48_clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module TFT_ILI9341 (
  input  wire [8:0]    io_data,
  input  wire          io_data_clk,
  output wire          io_ready,
  output wire          io_sending,
  output wire          io_fifo_full,
  output wire          io_displayReady,
  output wire          io_SPI_SCL,
  output wire          io_SPI_SDA,
  output wire          io_SPI_DC,
  output wire          io_SPI_RST,
  output wire          io_SPI_CS,
  input  wire          Core48_clk,
  input  wire          Core48_reset
);
  localparam fsm_enumDef_1_BOOT = 3'd0;
  localparam fsm_enumDef_1_Init = 3'd1;
  localparam fsm_enumDef_1_LoadParams = 3'd2;
  localparam fsm_enumDef_1_SendData = 3'd3;
  localparam fsm_enumDef_1_Done = 3'd4;

  reg        [8:0]    spi_io_data;
  reg                 spi_io_data_clk;
  wire       [9:0]    _zz_initParamsRom_port0;
  wire                spi_io_ready;
  wire                spi_io_sending;
  wire                spi_io_fifo_full;
  wire                spi_io_SPI_SCL;
  wire                spi_io_SPI_SDA;
  wire                spi_io_SPI_DC;
  wire                spi_io_SPI_RST;
  wire                spi_io_SPI_CS;
  wire       [6:0]    _zz_fsm_initParamsPointer_valueNext;
  wire       [0:0]    _zz_fsm_initParamsPointer_valueNext_1;
  wire       [18:0]   _zz_fsm_delayTimer_counter_valueNext;
  wire       [0:0]    _zz_fsm_delayTimer_counter_valueNext_1;
  wire       [9:0]    _zz_data;
  wire       [9:0]    _zz_when_TFT_ILI9341_l109;
  wire       [9:0]    _zz_when_TFT_ILI9341_l113;
  reg                 displayReady;
  reg                 data_clk;
  reg        [8:0]    data;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 fsm_initParamsPointer_willIncrement;
  reg                 fsm_initParamsPointer_willClear;
  reg        [6:0]    fsm_initParamsPointer_valueNext;
  reg        [6:0]    fsm_initParamsPointer_value;
  wire                fsm_initParamsPointer_willOverflowIfInc;
  wire                fsm_initParamsPointer_willOverflow;
  wire       [9:0]    fsm_paramData;
  reg                 fsm_delayTimer_state;
  reg                 fsm_delayTimer_stateRise;
  wire                fsm_delayTimer_counter_willIncrement;
  reg                 fsm_delayTimer_counter_willClear;
  reg        [18:0]   fsm_delayTimer_counter_valueNext;
  reg        [18:0]   fsm_delayTimer_counter_value;
  wire                fsm_delayTimer_counter_willOverflowIfInc;
  wire                fsm_delayTimer_counter_willOverflow;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  wire                when_TFT_ILI9341_l107;
  wire                when_TFT_ILI9341_l109;
  wire                when_TFT_ILI9341_l113;
  wire                when_TFT_ILI9341_l124;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif

  reg [9:0] initParamsRom [0:83];

  assign _zz_fsm_initParamsPointer_valueNext_1 = fsm_initParamsPointer_willIncrement;
  assign _zz_fsm_initParamsPointer_valueNext = {6'd0, _zz_fsm_initParamsPointer_valueNext_1};
  assign _zz_fsm_delayTimer_counter_valueNext_1 = fsm_delayTimer_counter_willIncrement;
  assign _zz_fsm_delayTimer_counter_valueNext = {18'd0, _zz_fsm_delayTimer_counter_valueNext_1};
  assign _zz_data = fsm_paramData;
  assign _zz_when_TFT_ILI9341_l109 = fsm_paramData;
  assign _zz_when_TFT_ILI9341_l113 = fsm_paramData;
  initial begin
    $readmemb("Top_ICE40.v_toplevel_lcd_Core48_LCD_tft_initParamsRom.bin",initParamsRom);
  end
  assign _zz_initParamsRom_port0 = initParamsRom[fsm_initParamsPointer_value];
  TFT_SPI spi (
    .io_data      (spi_io_data[8:0]), //i
    .io_data_clk  (spi_io_data_clk ), //i
    .io_ready     (spi_io_ready    ), //o
    .io_sending   (spi_io_sending  ), //o
    .io_fifo_full (spi_io_fifo_full), //o
    .io_SPI_SCL   (spi_io_SPI_SCL  ), //o
    .io_SPI_SDA   (spi_io_SPI_SDA  ), //o
    .io_SPI_DC    (spi_io_SPI_DC   ), //o
    .io_SPI_RST   (spi_io_SPI_RST  ), //o
    .io_SPI_CS    (spi_io_SPI_CS   ), //o
    .Core48_clk   (Core48_clk      ), //i
    .Core48_reset (Core48_reset    )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_1_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_1_Init : fsm_stateReg_string = "Init      ";
      fsm_enumDef_1_LoadParams : fsm_stateReg_string = "LoadParams";
      fsm_enumDef_1_SendData : fsm_stateReg_string = "SendData  ";
      fsm_enumDef_1_Done : fsm_stateReg_string = "Done      ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_1_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_1_Init : fsm_stateNext_string = "Init      ";
      fsm_enumDef_1_LoadParams : fsm_stateNext_string = "LoadParams";
      fsm_enumDef_1_SendData : fsm_stateNext_string = "SendData  ";
      fsm_enumDef_1_Done : fsm_stateNext_string = "Done      ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign io_displayReady = displayReady;
  assign io_SPI_SCL = spi_io_SPI_SCL;
  assign io_SPI_SDA = spi_io_SPI_SDA;
  assign io_SPI_RST = spi_io_SPI_RST;
  assign io_SPI_DC = spi_io_SPI_DC;
  assign io_SPI_CS = spi_io_SPI_CS;
  always @(*) begin
    if(displayReady) begin
      spi_io_data = io_data;
    end else begin
      spi_io_data = data;
    end
  end

  always @(*) begin
    if(displayReady) begin
      spi_io_data_clk = io_data_clk;
    end else begin
      spi_io_data_clk = data_clk;
    end
  end

  assign io_ready = spi_io_ready;
  assign io_sending = spi_io_sending;
  assign io_fifo_full = spi_io_fifo_full;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_Init : begin
      end
      fsm_enumDef_1_LoadParams : begin
      end
      fsm_enumDef_1_SendData : begin
      end
      fsm_enumDef_1_Done : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_initParamsPointer_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_Init : begin
      end
      fsm_enumDef_1_LoadParams : begin
      end
      fsm_enumDef_1_SendData : begin
        if(when_TFT_ILI9341_l124) begin
          fsm_initParamsPointer_willIncrement = 1'b1;
        end
      end
      fsm_enumDef_1_Done : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_initParamsPointer_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_Init : begin
        fsm_initParamsPointer_willClear = 1'b1;
      end
      fsm_enumDef_1_LoadParams : begin
      end
      fsm_enumDef_1_SendData : begin
      end
      fsm_enumDef_1_Done : begin
      end
      default : begin
      end
    endcase
  end

  assign fsm_initParamsPointer_willOverflowIfInc = (fsm_initParamsPointer_value == 7'h54);
  assign fsm_initParamsPointer_willOverflow = (fsm_initParamsPointer_willOverflowIfInc && fsm_initParamsPointer_willIncrement);
  always @(*) begin
    if(fsm_initParamsPointer_willOverflow) begin
      fsm_initParamsPointer_valueNext = 7'h00;
    end else begin
      fsm_initParamsPointer_valueNext = (fsm_initParamsPointer_value + _zz_fsm_initParamsPointer_valueNext);
    end
    if(fsm_initParamsPointer_willClear) begin
      fsm_initParamsPointer_valueNext = 7'h00;
    end
  end

  assign fsm_paramData = _zz_initParamsRom_port0;
  always @(*) begin
    fsm_delayTimer_stateRise = 1'b0;
    if(fsm_delayTimer_counter_willOverflow) begin
      fsm_delayTimer_stateRise = (! fsm_delayTimer_state);
    end
    case(fsm_stateReg)
      fsm_enumDef_1_Init : begin
      end
      fsm_enumDef_1_LoadParams : begin
        if(!when_TFT_ILI9341_l107) begin
          if(when_TFT_ILI9341_l109) begin
            fsm_delayTimer_stateRise = 1'b0;
          end
        end
      end
      fsm_enumDef_1_SendData : begin
      end
      fsm_enumDef_1_Done : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_delayTimer_counter_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_Init : begin
      end
      fsm_enumDef_1_LoadParams : begin
        if(!when_TFT_ILI9341_l107) begin
          if(when_TFT_ILI9341_l109) begin
            fsm_delayTimer_counter_willClear = 1'b1;
          end
        end
      end
      fsm_enumDef_1_SendData : begin
      end
      fsm_enumDef_1_Done : begin
      end
      default : begin
      end
    endcase
  end

  assign fsm_delayTimer_counter_willOverflowIfInc = (fsm_delayTimer_counter_value == 19'h752ff);
  assign fsm_delayTimer_counter_willOverflow = (fsm_delayTimer_counter_willOverflowIfInc && fsm_delayTimer_counter_willIncrement);
  always @(*) begin
    if(fsm_delayTimer_counter_willOverflow) begin
      fsm_delayTimer_counter_valueNext = 19'h00000;
    end else begin
      fsm_delayTimer_counter_valueNext = (fsm_delayTimer_counter_value + _zz_fsm_delayTimer_counter_valueNext);
    end
    if(fsm_delayTimer_counter_willClear) begin
      fsm_delayTimer_counter_valueNext = 19'h00000;
    end
  end

  assign fsm_delayTimer_counter_willIncrement = 1'b1;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_1_Init : begin
        if(spi_io_ready) begin
          fsm_stateNext = fsm_enumDef_1_LoadParams;
        end
      end
      fsm_enumDef_1_LoadParams : begin
        if(when_TFT_ILI9341_l107) begin
          fsm_stateNext = fsm_enumDef_1_Done;
        end else begin
          if(when_TFT_ILI9341_l109) begin
            fsm_stateNext = fsm_enumDef_1_SendData;
          end else begin
            if(when_TFT_ILI9341_l113) begin
              fsm_stateNext = fsm_enumDef_1_SendData;
            end
          end
        end
      end
      fsm_enumDef_1_SendData : begin
        if(when_TFT_ILI9341_l124) begin
          fsm_stateNext = fsm_enumDef_1_LoadParams;
        end
      end
      fsm_enumDef_1_Done : begin
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_1_Init;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_1_BOOT;
    end
  end

  assign when_TFT_ILI9341_l107 = (fsm_paramData == 10'h3ff);
  assign when_TFT_ILI9341_l109 = (_zz_when_TFT_ILI9341_l109[9] && (! spi_io_sending));
  assign when_TFT_ILI9341_l113 = (! _zz_when_TFT_ILI9341_l113[9]);
  assign when_TFT_ILI9341_l124 = (fsm_delayTimer_state && (! spi_io_fifo_full));
  always @(posedge Core48_clk) begin
    if(Core48_reset) begin
      displayReady <= 1'b0;
      data_clk <= 1'b0;
      fsm_initParamsPointer_value <= 7'h00;
      fsm_delayTimer_state <= 1'b0;
      fsm_delayTimer_counter_value <= 19'h00000;
      fsm_stateReg <= fsm_enumDef_1_BOOT;
    end else begin
      fsm_initParamsPointer_value <= fsm_initParamsPointer_valueNext;
      fsm_delayTimer_counter_value <= fsm_delayTimer_counter_valueNext;
      if(fsm_delayTimer_counter_willOverflow) begin
        fsm_delayTimer_state <= 1'b1;
      end
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_1_Init : begin
        end
        fsm_enumDef_1_LoadParams : begin
          if(!when_TFT_ILI9341_l107) begin
            if(when_TFT_ILI9341_l109) begin
              data_clk <= 1'b1;
              fsm_delayTimer_state <= 1'b0;
            end else begin
              if(when_TFT_ILI9341_l113) begin
                data_clk <= 1'b1;
              end
            end
          end
        end
        fsm_enumDef_1_SendData : begin
          data_clk <= 1'b0;
        end
        fsm_enumDef_1_Done : begin
          displayReady <= 1'b1;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge Core48_clk) begin
    case(fsm_stateReg)
      fsm_enumDef_1_Init : begin
      end
      fsm_enumDef_1_LoadParams : begin
        data <= _zz_data[8 : 0];
      end
      fsm_enumDef_1_SendData : begin
      end
      fsm_enumDef_1_Done : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module TFT_SPI (
  input  wire [8:0]    io_data,
  input  wire          io_data_clk,
  output wire          io_ready,
  output wire          io_sending,
  output wire          io_fifo_full,
  output wire          io_SPI_SCL,
  output wire          io_SPI_SDA,
  output wire          io_SPI_DC,
  output wire          io_SPI_RST,
  output wire          io_SPI_CS,
  input  wire          Core48_clk,
  input  wire          Core48_reset
);
  localparam fsm_enumDef_2_BOOT = 3'd0;
  localparam fsm_enumDef_2_Init = 3'd1;
  localparam fsm_enumDef_2_ResetDisplay = 3'd2;
  localparam fsm_enumDef_2_WaitForData = 3'd3;
  localparam fsm_enumDef_2_OutData = 3'd4;
  localparam fsm_enumDef_2_ShiftData = 3'd5;

  wire                spiFiFo_io_flush;
  wire                spiFiFo_io_push_ready;
  wire                spiFiFo_io_pop_valid;
  wire       [8:0]    spiFiFo_io_pop_payload;
  wire       [4:0]    spiFiFo_io_occupancy;
  wire       [4:0]    spiFiFo_io_availability;
  wire       [2:0]    _zz_bitCount_valueNext;
  wire       [0:0]    _zz_bitCount_valueNext_1;
  wire                source_valid;
  wire                source_ready;
  wire       [8:0]    source_payload;
  wire                sink_valid;
  reg                 sink_ready;
  wire       [8:0]    sink_payload;
  wire                validRegSource;
  reg                 fifo_full;
  reg                 ready;
  reg                 sending;
  reg                 bitCount_willIncrement;
  reg                 bitCount_willClear;
  reg        [2:0]    bitCount_valueNext;
  reg        [2:0]    bitCount_value;
  wire                bitCount_willOverflowIfInc;
  wire                bitCount_willOverflow;
  reg        [7:0]    shiftReg;
  reg                 SPI_SCL;
  reg                 SPI_SDA;
  reg                 SPI_DC;
  reg                 SPI_RST;
  reg                 SPI_CS;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [18:0]   _zz_when_State_l238;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  wire                when_State_l238;
  wire                when_State_l238_1;
  wire                when_TFT_SPI_l118;
  wire                when_StateMachine_l253;
  wire                when_StateMachine_l253_1;
  `ifndef SYNTHESIS
  reg [95:0] fsm_stateReg_string;
  reg [95:0] fsm_stateNext_string;
  `endif


  assign _zz_bitCount_valueNext_1 = bitCount_willIncrement;
  assign _zz_bitCount_valueNext = {2'd0, _zz_bitCount_valueNext_1};
  StreamFifo_1 spiFiFo (
    .io_push_valid   (source_valid                ), //i
    .io_push_ready   (spiFiFo_io_push_ready       ), //o
    .io_push_payload (source_payload[8:0]         ), //i
    .io_pop_valid    (spiFiFo_io_pop_valid        ), //o
    .io_pop_ready    (sink_ready                  ), //i
    .io_pop_payload  (spiFiFo_io_pop_payload[8:0] ), //o
    .io_flush        (spiFiFo_io_flush            ), //i
    .io_occupancy    (spiFiFo_io_occupancy[4:0]   ), //o
    .io_availability (spiFiFo_io_availability[4:0]), //o
    .Core48_clk      (Core48_clk                  ), //i
    .Core48_reset    (Core48_reset                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_2_BOOT : fsm_stateReg_string = "BOOT        ";
      fsm_enumDef_2_Init : fsm_stateReg_string = "Init        ";
      fsm_enumDef_2_ResetDisplay : fsm_stateReg_string = "ResetDisplay";
      fsm_enumDef_2_WaitForData : fsm_stateReg_string = "WaitForData ";
      fsm_enumDef_2_OutData : fsm_stateReg_string = "OutData     ";
      fsm_enumDef_2_ShiftData : fsm_stateReg_string = "ShiftData   ";
      default : fsm_stateReg_string = "????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_2_BOOT : fsm_stateNext_string = "BOOT        ";
      fsm_enumDef_2_Init : fsm_stateNext_string = "Init        ";
      fsm_enumDef_2_ResetDisplay : fsm_stateNext_string = "ResetDisplay";
      fsm_enumDef_2_WaitForData : fsm_stateNext_string = "WaitForData ";
      fsm_enumDef_2_OutData : fsm_stateNext_string = "OutData     ";
      fsm_enumDef_2_ShiftData : fsm_stateNext_string = "ShiftData   ";
      default : fsm_stateNext_string = "????????????";
    endcase
  end
  `endif

  assign source_ready = spiFiFo_io_push_ready;
  assign sink_valid = spiFiFo_io_pop_valid;
  assign sink_payload = spiFiFo_io_pop_payload;
  always @(*) begin
    sink_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_2_Init : begin
      end
      fsm_enumDef_2_ResetDisplay : begin
      end
      fsm_enumDef_2_WaitForData : begin
        if(sink_valid) begin
          sink_ready = 1'b1;
        end
      end
      fsm_enumDef_2_OutData : begin
        sink_ready = 1'b0;
      end
      fsm_enumDef_2_ShiftData : begin
        if(when_TFT_SPI_l118) begin
          if(sink_valid) begin
            sink_ready = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign validRegSource = 1'b0;
  assign source_valid = io_data_clk;
  assign source_payload = io_data;
  assign io_fifo_full = fifo_full;
  assign io_ready = ready;
  assign io_sending = sending;
  always @(*) begin
    bitCount_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_2_Init : begin
      end
      fsm_enumDef_2_ResetDisplay : begin
      end
      fsm_enumDef_2_WaitForData : begin
      end
      fsm_enumDef_2_OutData : begin
      end
      fsm_enumDef_2_ShiftData : begin
        bitCount_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    bitCount_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_2_Init : begin
      end
      fsm_enumDef_2_ResetDisplay : begin
      end
      fsm_enumDef_2_WaitForData : begin
        if(sink_valid) begin
          bitCount_willClear = 1'b1;
        end
      end
      fsm_enumDef_2_OutData : begin
      end
      fsm_enumDef_2_ShiftData : begin
        if(when_TFT_SPI_l118) begin
          if(sink_valid) begin
            bitCount_willClear = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign bitCount_willOverflowIfInc = (bitCount_value == 3'b111);
  assign bitCount_willOverflow = (bitCount_willOverflowIfInc && bitCount_willIncrement);
  always @(*) begin
    bitCount_valueNext = (bitCount_value + _zz_bitCount_valueNext);
    if(bitCount_willClear) begin
      bitCount_valueNext = 3'b000;
    end
  end

  assign io_SPI_SCL = SPI_SCL;
  assign io_SPI_SDA = SPI_SDA;
  assign io_SPI_DC = SPI_DC;
  assign io_SPI_RST = SPI_RST;
  assign io_SPI_CS = SPI_CS;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_2_Init : begin
      end
      fsm_enumDef_2_ResetDisplay : begin
      end
      fsm_enumDef_2_WaitForData : begin
      end
      fsm_enumDef_2_OutData : begin
      end
      fsm_enumDef_2_ShiftData : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_2_Init : begin
        if(when_State_l238) begin
          fsm_stateNext = fsm_enumDef_2_ResetDisplay;
        end
      end
      fsm_enumDef_2_ResetDisplay : begin
        if(when_State_l238_1) begin
          fsm_stateNext = fsm_enumDef_2_WaitForData;
        end
      end
      fsm_enumDef_2_WaitForData : begin
        if(sink_valid) begin
          fsm_stateNext = fsm_enumDef_2_OutData;
        end
      end
      fsm_enumDef_2_OutData : begin
        fsm_stateNext = fsm_enumDef_2_ShiftData;
      end
      fsm_enumDef_2_ShiftData : begin
        if(when_TFT_SPI_l118) begin
          if(sink_valid) begin
            fsm_stateNext = fsm_enumDef_2_OutData;
          end else begin
            fsm_stateNext = fsm_enumDef_2_WaitForData;
          end
        end else begin
          fsm_stateNext = fsm_enumDef_2_OutData;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_2_Init;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_2_BOOT;
    end
  end

  assign when_State_l238 = (_zz_when_State_l238 <= 19'h00001);
  assign when_State_l238_1 = (_zz_when_State_l238 <= 19'h00001);
  assign when_TFT_SPI_l118 = (bitCount_value == 3'b111);
  assign when_StateMachine_l253 = ((! (fsm_stateReg == fsm_enumDef_2_Init)) && (fsm_stateNext == fsm_enumDef_2_Init));
  assign when_StateMachine_l253_1 = ((! (fsm_stateReg == fsm_enumDef_2_ResetDisplay)) && (fsm_stateNext == fsm_enumDef_2_ResetDisplay));
  assign spiFiFo_io_flush = 1'b0;
  always @(posedge Core48_clk) begin
    if(Core48_reset) begin
      fifo_full <= 1'b0;
      ready <= 1'b0;
      sending <= 1'b0;
      bitCount_value <= 3'b000;
      shiftReg <= 8'h00;
      SPI_SCL <= 1'b1;
      SPI_SDA <= 1'b0;
      SPI_DC <= 1'b0;
      SPI_RST <= 1'b0;
      SPI_CS <= 1'b1;
      fsm_stateReg <= fsm_enumDef_2_BOOT;
    end else begin
      fifo_full <= (spiFiFo_io_availability < 5'h02);
      bitCount_value <= bitCount_valueNext;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_2_Init : begin
          SPI_RST <= 1'b0;
        end
        fsm_enumDef_2_ResetDisplay : begin
          SPI_RST <= 1'b1;
          if(when_State_l238_1) begin
            ready <= 1'b1;
          end
        end
        fsm_enumDef_2_WaitForData : begin
          if(sink_valid) begin
            shiftReg <= sink_payload[7 : 0];
            SPI_DC <= sink_payload[8];
            SPI_CS <= 1'b0;
            sending <= 1'b1;
          end else begin
            sending <= 1'b0;
          end
        end
        fsm_enumDef_2_OutData : begin
          SPI_SDA <= shiftReg[7];
          SPI_SCL <= 1'b0;
        end
        fsm_enumDef_2_ShiftData : begin
          shiftReg <= (shiftReg <<< 1);
          SPI_SCL <= 1'b1;
          if(when_TFT_SPI_l118) begin
            if(sink_valid) begin
              shiftReg <= sink_payload[7 : 0];
              SPI_DC <= sink_payload[8];
            end else begin
              SPI_CS <= 1'b1;
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge Core48_clk) begin
    case(fsm_stateReg)
      fsm_enumDef_2_Init : begin
        _zz_when_State_l238 <= (_zz_when_State_l238 - 19'h00001);
      end
      fsm_enumDef_2_ResetDisplay : begin
        _zz_when_State_l238 <= (_zz_when_State_l238 - 19'h00001);
      end
      fsm_enumDef_2_WaitForData : begin
      end
      fsm_enumDef_2_OutData : begin
      end
      fsm_enumDef_2_ShiftData : begin
      end
      default : begin
      end
    endcase
    if(when_StateMachine_l253) begin
      _zz_when_State_l238 <= 19'h75300;
    end
    if(when_StateMachine_l253_1) begin
      _zz_when_State_l238 <= 19'h75300;
    end
  end


endmodule

module StreamFifo_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [8:0]    io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [8:0]    io_pop_payload,
  input  wire          io_flush,
  output wire [4:0]    io_occupancy,
  output wire [4:0]    io_availability,
  input  wire          Core48_clk,
  input  wire          Core48_reset
);

  reg        [8:0]    _zz_logic_ram_port1;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [4:0]    logic_ptr_push;
  reg        [4:0]    logic_ptr_pop;
  wire       [4:0]    logic_ptr_occupancy;
  wire       [4:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [8:0]    logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [3:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [8:0]    logic_pop_sync_readPort_rsp;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [8:0]    logic_pop_sync_readArbitation_translated_payload;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [4:0]    logic_pop_sync_popReg;
  reg [8:0] logic_ram [0:15];

  always @(posedge Core48_clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= logic_push_onRam_write_payload_data;
    end
  end

  always @(posedge Core48_clk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 5'h10) == 5'h00);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[3:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[3:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign logic_pop_sync_readPort_rsp = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload = logic_pop_sync_readPort_rsp;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload = logic_pop_sync_readArbitation_translated_payload;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (5'h10 - logic_ptr_occupancy);
  always @(posedge Core48_clk) begin
    if(Core48_reset) begin
      logic_ptr_push <= 5'h00;
      logic_ptr_pop <= 5'h00;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 5'h00;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 5'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 5'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 5'h00;
        logic_ptr_pop <= 5'h00;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 5'h00;
      end
    end
  end

  always @(posedge Core48_clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule
