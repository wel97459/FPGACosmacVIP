// Generator : SpinalHDL v1.8.0    git head : 4e3563a282582b41f4eaafc503787757251d23ea
// Component : Top_ECP5
// Git hash  : 0a8dedcbadf236560cad9021a09fb48e45ad08bb

`timescale 1ns/1ps

module Top_ECP5 (
  input               reset_,
  input               clk_25Mhz,
  output              video,
  output              sync,
  output     [2:0]    burst,
  output              phyrst_,
  output              led_red,
  input      [3:0]    keypad_col,
  output     [3:0]    keypad_row
);

  wire       [3:0]    Core17_areaDiv_Cpu_io_EF_n;
  reg        [7:0]    Core17_areaDiv_Cpu_io_DataIn;
  wire                Core17_areaDiv_Pixie_io_Disp_On;
  wire                Core17_areaDiv_Pixie_io_Disp_Off;
  wire       [8:0]    Core17_areaDiv_Rom_io_addra;
  wire       [0:0]    Core17_areaDiv_Ram_io_wea;
  wire       [12:0]   Core17_areaDiv_Ram_io_addra;
  wire                Core17_areaDiv_keypad_io_LatchKey;
  wire       [3:0]    Core17_areaDiv_keypad_io_Key;
  wire                PLL_clkout0;
  wire                PLL_clkout1;
  wire                PLL_locked;
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
  wire       [23:0]   _zz_Core25_rstCounter_valueNext;
  wire       [0:0]    _zz_Core25_rstCounter_valueNext_1;
  wire       [4:0]    _zz_Core17_rstCounter_valueNext;
  wire       [0:0]    _zz_Core17_rstCounter_valueNext_1;
  wire       [9:0]    _zz_Core17_areaDiv_beeper_valueNext;
  wire       [0:0]    _zz_Core17_areaDiv_beeper_valueNext_1;
  wire                Core50_clk;
  wire                Core50_reset;
  wire                Core17_clk;
  wire                Core17_reset;
  wire                Core25_clk;
  wire                Core25_reset;
  reg                 Core25_reset_1;
  wire                Core25_rstCounter_willIncrement;
  reg                 Core25_rstCounter_willClear;
  reg        [23:0]   Core25_rstCounter_valueNext;
  reg        [23:0]   Core25_rstCounter_value;
  wire                Core25_rstCounter_willOverflowIfInc;
  wire                Core25_rstCounter_willOverflow;
  wire                when_Top_ECP5_l68;
  reg                 Core17_reset_1;
  wire                Core17_rstCounter_willIncrement;
  wire                Core17_rstCounter_willClear;
  reg        [4:0]    Core17_rstCounter_valueNext;
  reg        [4:0]    Core17_rstCounter_value;
  wire                Core17_rstCounter_willOverflowIfInc;
  wire                Core17_rstCounter_willOverflow;
  reg        [2:0]    Core17_b;
  reg        [3:0]    _zz_when_ClockDomain_l369;
  wire                when_ClockDomain_l369;
  reg                 when_ClockDomain_l369_regNext;
  wire                _zz_1;
  reg                 Core17_areaDiv_romBootLatch;
  wire                when_Top_ECP5_l138;
  wire                when_Top_ECP5_l140;
  wire                Core17_areaDiv_beeper_willIncrement;
  wire                Core17_areaDiv_beeper_willClear;
  reg        [9:0]    Core17_areaDiv_beeper_valueNext;
  reg        [9:0]    Core17_areaDiv_beeper_value;
  wire                Core17_areaDiv_beeper_willOverflowIfInc;
  wire                Core17_areaDiv_beeper_willOverflow;

  assign _zz_Core25_rstCounter_valueNext_1 = Core25_rstCounter_willIncrement;
  assign _zz_Core25_rstCounter_valueNext = {23'd0, _zz_Core25_rstCounter_valueNext_1};
  assign _zz_Core17_rstCounter_valueNext_1 = Core17_rstCounter_willIncrement;
  assign _zz_Core17_rstCounter_valueNext = {4'd0, _zz_Core17_rstCounter_valueNext_1};
  assign _zz_Core17_areaDiv_beeper_valueNext_1 = Core17_areaDiv_beeper_willIncrement;
  assign _zz_Core17_areaDiv_beeper_valueNext = {9'd0, _zz_Core17_areaDiv_beeper_valueNext_1};
  ecp5_pll PLL (
    .clkin   (clk_25Mhz  ), //i
    .clkout0 (PLL_clkout0), //o
    .clkout1 (PLL_clkout1), //o
    .locked  (PLL_locked )  //o
  );
  Spinal1802 Core17_areaDiv_Cpu (
    .io_Wait_n      (1'b1                              ), //i
    .io_Clear_n     (Core17_areaDiv_Pixie_io_Clear     ), //i
    .io_DMA_In_n    (1'b1                              ), //i
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
    ._zz_1_1        (_zz_1                             )  //i
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
  RamInit_1 Core17_areaDiv_Rom (
    .io_ena       (1'b1                            ), //i
    .io_wea       (1'b0                            ), //i
    .io_addra     (Core17_areaDiv_Rom_io_addra[8:0]), //i
    .io_douta     (Core17_areaDiv_Rom_io_douta[7:0]), //o
    .io_dina      (8'h0                            ), //i
    .Core17_clk   (Core17_clk                      ), //i
    .Core17_reset (Core17_reset                    ), //i
    ._zz_1        (_zz_1                           )  //i
  );
  RamInit Core17_areaDiv_Ram (
    .io_ena       (1'b1                              ), //i
    .io_wea       (Core17_areaDiv_Ram_io_wea         ), //i
    .io_addra     (Core17_areaDiv_Ram_io_addra[12:0] ), //i
    .io_douta     (Core17_areaDiv_Ram_io_douta[7:0]  ), //o
    .io_dina      (Core17_areaDiv_Cpu_io_DataOut[7:0]), //i
    .Core17_clk   (Core17_clk                        ), //i
    .Core17_reset (Core17_reset                      ), //i
    ._zz_1        (_zz_1                             )  //i
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
  assign phyrst_ = 1'b1; // @[Top_ECP5.scala 47:16]
  assign Core25_clk = clk_25Mhz; // @[Top_ECP5.scala 62:23]
  assign Core25_reset = (! reset_); // @[Top_ECP5.scala 63:23]
  always @(*) begin
    Core25_rstCounter_willClear = 1'b0; // @[Utils.scala 537:19]
    if(when_Top_ECP5_l68) begin
      Core25_rstCounter_willClear = 1'b1; // @[Utils.scala 539:33]
    end
  end

  assign Core25_rstCounter_willOverflowIfInc = (Core25_rstCounter_value == 24'h8583af); // @[BaseType.scala 305:24]
  assign Core25_rstCounter_willOverflow = (Core25_rstCounter_willOverflowIfInc && Core25_rstCounter_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    if(Core25_rstCounter_willOverflow) begin
      Core25_rstCounter_valueNext = 24'h0; // @[Utils.scala 552:17]
    end else begin
      Core25_rstCounter_valueNext = (Core25_rstCounter_value + _zz_Core25_rstCounter_valueNext); // @[Utils.scala 554:17]
    end
    if(Core25_rstCounter_willClear) begin
      Core25_rstCounter_valueNext = 24'h0; // @[Utils.scala 558:15]
    end
  end

  assign Core25_rstCounter_willIncrement = 1'b1; // @[Utils.scala 540:41]
  assign when_Top_ECP5_l68 = (! PLL_locked); // @[BaseType.scala 299:24]
  assign Core17_clk = PLL_clkout0; // @[Top_ECP5.scala 76:23]
  assign Core17_reset = (! Core25_reset_1); // @[Top_ECP5.scala 77:23]
  assign Core50_clk = PLL_clkout1; // @[Top_ECP5.scala 80:23]
  assign Core50_reset = (! Core25_reset_1); // @[Top_ECP5.scala 81:23]
  assign Core17_rstCounter_willClear = 1'b0; // @[Utils.scala 537:19]
  assign Core17_rstCounter_willOverflowIfInc = (Core17_rstCounter_value == 5'h18); // @[BaseType.scala 305:24]
  assign Core17_rstCounter_willOverflow = (Core17_rstCounter_willOverflowIfInc && Core17_rstCounter_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    if(Core17_rstCounter_willOverflow) begin
      Core17_rstCounter_valueNext = 5'h0; // @[Utils.scala 552:17]
    end else begin
      Core17_rstCounter_valueNext = (Core17_rstCounter_value + _zz_Core17_rstCounter_valueNext); // @[Utils.scala 554:17]
    end
    if(Core17_rstCounter_willClear) begin
      Core17_rstCounter_valueNext = 5'h0; // @[Utils.scala 558:15]
    end
  end

  assign Core17_rstCounter_willIncrement = 1'b1; // @[Utils.scala 540:41]
  assign burst = Core17_b; // @[Top_ECP5.scala 92:18]
  assign when_ClockDomain_l369 = (_zz_when_ClockDomain_l369 == 4'b1001); // @[BaseType.scala 305:24]
  assign _zz_1 = (when_ClockDomain_l369_regNext || Core17_reset); // @[BaseType.scala 305:24]
  assign Core17_areaDiv_Pixie_io_Disp_On = (((Core17_areaDiv_Cpu_io_N == 3'b001) && Core17_areaDiv_Cpu_io_TPB) && (! Core17_areaDiv_Cpu_io_MWR)); // @[Top_ECP5.scala 108:30]
  assign Core17_areaDiv_Pixie_io_Disp_Off = (((Core17_areaDiv_Cpu_io_N == 3'b001) && Core17_areaDiv_Cpu_io_TPB) && (! Core17_areaDiv_Cpu_io_MRD)); // @[Top_ECP5.scala 109:31]
  assign Core17_areaDiv_Rom_io_addra = Core17_areaDiv_Cpu_io_Addr16[8 : 0]; // @[Top_ECP5.scala 121:30]
  assign Core17_areaDiv_Ram_io_wea = (! Core17_areaDiv_Cpu_io_MWR); // @[Top_ECP5.scala 125:28]
  assign Core17_areaDiv_Ram_io_addra = Core17_areaDiv_Cpu_io_Addr16[12 : 0]; // @[Top_ECP5.scala 127:30]
  assign when_Top_ECP5_l138 = ((! Core17_areaDiv_romBootLatch) || ((16'h8000 <= Core17_areaDiv_Cpu_io_Addr16) && (Core17_areaDiv_Cpu_io_Addr16 <= 16'h81ff))); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_Top_ECP5_l138) begin
      Core17_areaDiv_Cpu_io_DataIn = Core17_areaDiv_Rom_io_douta; // @[Top_ECP5.scala 139:35]
    end else begin
      if(when_Top_ECP5_l140) begin
        Core17_areaDiv_Cpu_io_DataIn = Core17_areaDiv_Ram_io_douta; // @[Top_ECP5.scala 141:35]
      end else begin
        Core17_areaDiv_Cpu_io_DataIn = 8'h0; // @[Top_ECP5.scala 143:35]
      end
    end
  end

  assign when_Top_ECP5_l140 = (Core17_areaDiv_Cpu_io_Addr16 < 16'h2000); // @[BaseType.scala 305:24]
  assign Core17_areaDiv_keypad_io_LatchKey = (((Core17_areaDiv_Cpu_io_N == 3'b010) && Core17_areaDiv_Cpu_io_TPB) && (! Core17_areaDiv_Cpu_io_MRD)); // @[Top_ECP5.scala 147:36]
  assign Core17_areaDiv_keypad_io_Key = Core17_areaDiv_Cpu_io_DataOut[3 : 0]; // @[Top_ECP5.scala 148:31]
  assign keypad_row = (~ Core17_areaDiv_keypad_io_KeypadRow); // @[Top_ECP5.scala 149:31]
  assign Core17_areaDiv_Cpu_io_EF_n = {1'b1,{Core17_areaDiv_keypad_io_KeyOut,{1'b1,Core17_areaDiv_Pixie_io_EFx}}}; // @[Top_ECP5.scala 152:25]
  assign Core17_areaDiv_beeper_willClear = 1'b0; // @[Utils.scala 537:19]
  assign Core17_areaDiv_beeper_willOverflowIfInc = (Core17_areaDiv_beeper_value == 10'h3e7); // @[BaseType.scala 305:24]
  assign Core17_areaDiv_beeper_willOverflow = (Core17_areaDiv_beeper_willOverflowIfInc && Core17_areaDiv_beeper_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    if(Core17_areaDiv_beeper_willOverflow) begin
      Core17_areaDiv_beeper_valueNext = 10'h0; // @[Utils.scala 552:17]
    end else begin
      Core17_areaDiv_beeper_valueNext = (Core17_areaDiv_beeper_value + _zz_Core17_areaDiv_beeper_valueNext); // @[Utils.scala 554:17]
    end
    if(Core17_areaDiv_beeper_willClear) begin
      Core17_areaDiv_beeper_valueNext = 10'h0; // @[Utils.scala 558:15]
    end
  end

  assign Core17_areaDiv_beeper_willIncrement = 1'b1; // @[Utils.scala 540:41]
  assign sync = Core17_areaDiv_Pixie_io_CompSync_; // @[Top_ECP5.scala 156:21]
  assign video = Core17_areaDiv_Pixie_io_Video; // @[Top_ECP5.scala 157:22]
  assign led_red = (! (Core17_areaDiv_Cpu_io_Q && (Core17_areaDiv_beeper_value < 10'h032))); // @[Top_ECP5.scala 159:24]
  always @(posedge Core25_clk) begin
    if(Core25_reset) begin
      Core25_reset_1 <= 1'b0; // @[Data.scala 400:33]
      Core25_rstCounter_value <= 24'h0; // @[Data.scala 400:33]
    end else begin
      Core25_rstCounter_value <= Core25_rstCounter_valueNext; // @[Reg.scala 39:30]
      if(!when_Top_ECP5_l68) begin
        if(Core25_rstCounter_willOverflow) begin
          Core25_reset_1 <= 1'b1; // @[Top_ECP5.scala 71:19]
        end
      end
    end
  end

  always @(posedge Core17_clk) begin
    if(Core17_reset) begin
      Core17_reset_1 <= 1'b0; // @[Data.scala 400:33]
      Core17_rstCounter_value <= 5'h0; // @[Data.scala 400:33]
      _zz_when_ClockDomain_l369 <= 4'b0000; // @[Data.scala 400:33]
      when_ClockDomain_l369_regNext <= 1'b0; // @[Data.scala 400:33]
    end else begin
      Core17_rstCounter_value <= Core17_rstCounter_valueNext; // @[Reg.scala 39:30]
      if(Core17_rstCounter_willOverflow) begin
        Core17_reset_1 <= 1'b1; // @[Top_ECP5.scala 87:19]
      end
      _zz_when_ClockDomain_l369 <= (_zz_when_ClockDomain_l369 + 4'b0001); // @[ClockDomain.scala 368:15]
      if(when_ClockDomain_l369) begin
        _zz_when_ClockDomain_l369 <= 4'b0000; // @[ClockDomain.scala 370:17]
      end
      when_ClockDomain_l369_regNext <= when_ClockDomain_l369; // @[Reg.scala 39:30]
    end
  end

  always @(posedge Core17_clk) begin
    Core17_b <= (Core17_b + 3'b001); // @[Top_ECP5.scala 91:11]
  end

  always @(posedge Core17_clk) begin
    if(_zz_1) begin
      if(Core17_reset) begin
      Core17_areaDiv_romBootLatch <= 1'b0; // @[Data.scala 400:33]
      Core17_areaDiv_beeper_value <= 10'h0; // @[Data.scala 400:33]
      end else begin
        Core17_areaDiv_romBootLatch <= 1'b1; // @[Top_ECP5.scala 135:34]
        Core17_areaDiv_beeper_value <= Core17_areaDiv_beeper_valueNext; // @[Reg.scala 39:30]
      end
    end
  end


endmodule

module Keypad (
  input               io_LatchKey,
  input      [3:0]    io_Key,
  output reg          io_KeyOut,
  input      [3:0]    io_KeypadCol,
  output reg [3:0]    io_KeypadRow,
  input               Core17_clk,
  input               Core17_reset,
  input               _zz_1
);

  reg        [3:0]    Key;
  wire                when_Keypad_l29;
  wire                when_Keypad_l31;
  wire                when_Keypad_l33;
  wire                when_Keypad_l35;

  always @(*) begin
    io_KeypadRow[0] = ((((Key == 4'b0001) || (Key == 4'b0010)) || (Key == 4'b0011)) || (Key == 4'b1100)); // @[Keypad.scala 24:21]
    io_KeypadRow[1] = ((((Key == 4'b0100) || (Key == 4'b0101)) || (Key == 4'b0110)) || (Key == 4'b1101)); // @[Keypad.scala 25:21]
    io_KeypadRow[2] = ((((Key == 4'b0111) || (Key == 4'b1000)) || (Key == 4'b1001)) || (Key == 4'b1110)); // @[Keypad.scala 26:21]
    io_KeypadRow[3] = ((((Key == 4'b1010) || (Key == 4'b0000)) || (Key == 4'b1011)) || (Key == 4'b1111)); // @[Keypad.scala 27:21]
  end

  assign when_Keypad_l29 = ((((Key == 4'b0001) || (Key == 4'b0100)) || (Key == 4'b0111)) || (Key == 4'b1010)); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_Keypad_l29) begin
      io_KeyOut = io_KeypadCol[0]; // @[Keypad.scala 30:19]
    end else begin
      if(when_Keypad_l31) begin
        io_KeyOut = io_KeypadCol[1]; // @[Keypad.scala 32:19]
      end else begin
        if(when_Keypad_l33) begin
          io_KeyOut = io_KeypadCol[2]; // @[Keypad.scala 34:19]
        end else begin
          if(when_Keypad_l35) begin
            io_KeyOut = io_KeypadCol[3]; // @[Keypad.scala 36:19]
          end else begin
            io_KeyOut = 1'b0; // @[Keypad.scala 37:26]
          end
        end
      end
    end
  end

  assign when_Keypad_l31 = ((((Key == 4'b0010) || (Key == 4'b0101)) || (Key == 4'b1000)) || (Key == 4'b0000)); // @[BaseType.scala 305:24]
  assign when_Keypad_l33 = ((((Key == 4'b0011) || (Key == 4'b0110)) || (Key == 4'b1001)) || (Key == 4'b1011)); // @[BaseType.scala 305:24]
  assign when_Keypad_l35 = ((((Key == 4'b1100) || (Key == 4'b1101)) || (Key == 4'b1110)) || (Key == 4'b1111)); // @[BaseType.scala 305:24]
  always @(posedge Core17_clk) begin
    if(_zz_1) begin
      if(Core17_reset) begin
      Key <= 4'b0000; // @[Data.scala 400:33]
      end else begin
        if(io_LatchKey) begin
          Key <= io_Key; // @[Keypad.scala 21:13]
        end
      end
    end
  end


endmodule

module RamInit (
  input               io_ena,
  input      [0:0]    io_wea,
  input      [12:0]   io_addra,
  output     [7:0]    io_douta,
  input      [7:0]    io_dina,
  input               Core17_clk,
  input               Core17_reset,
  input               _zz_1
);

  reg        [7:0]    _zz_mem_port1;
  wire       [12:0]   _zz_mem_port;
  wire                _zz_mem_port_1;
  wire       [12:0]   _zz_io_douta;
  reg [7:0] mem [0:8191];

  assign _zz_mem_port = io_addra;
  assign _zz_mem_port_1 = (io_ena && io_wea[0]);
  initial begin
    $readmemb("Top_ECP5.v_toplevel_Core17_areaDiv_Ram_mem.bin",mem);
  end
  always @(posedge Core17_clk) begin
    if(_zz_1) begin
      if(_zz_mem_port_1) begin
        mem[_zz_mem_port] <= io_dina;
      end
    end
  end

  always @(posedge Core17_clk) begin
    if(_zz_1) begin
      if(io_ena) begin
        _zz_mem_port1 <= mem[_zz_io_douta];
      end
    end
  end

  assign _zz_io_douta = io_addra; // @[BaseType.scala 318:22]
  assign io_douta = _zz_mem_port1; // @[Ram.scala 36:14]

endmodule

module RamInit_1 (
  input               io_ena,
  input      [0:0]    io_wea,
  input      [8:0]    io_addra,
  output     [7:0]    io_douta,
  input      [7:0]    io_dina,
  input               Core17_clk,
  input               Core17_reset,
  input               _zz_1
);

  reg        [7:0]    _zz_mem_port1;
  wire       [8:0]    _zz_mem_port;
  wire                _zz_mem_port_1;
  wire       [8:0]    _zz_io_douta;
  reg [7:0] mem [0:511];

  assign _zz_mem_port = io_addra;
  assign _zz_mem_port_1 = (io_ena && io_wea[0]);
  initial begin
    $readmemb("Top_ECP5.v_toplevel_Core17_areaDiv_Rom_mem.bin",mem);
  end
  always @(posedge Core17_clk) begin
    if(_zz_1) begin
      if(_zz_mem_port_1) begin
        mem[_zz_mem_port] <= io_dina;
      end
    end
  end

  always @(posedge Core17_clk) begin
    if(_zz_1) begin
      if(io_ena) begin
        _zz_mem_port1 <= mem[_zz_io_douta];
      end
    end
  end

  assign _zz_io_douta = io_addra; // @[BaseType.scala 318:22]
  assign io_douta = _zz_mem_port1; // @[Ram.scala 36:14]

endmodule

module Spinal1861 (
  input               io_Reset_,
  input               io_Disp_On,
  input               io_Disp_Off,
  input               io_TPA,
  input               io_TPB,
  input      [1:0]    io_SC,
  input      [7:0]    io_DataIn,
  output reg          io_Clear,
  output reg          io_INT,
  output reg          io_DMAO,
  output reg          io_EFx,
  output              io_Video,
  output              io_CompSync_,
  output              io_Locked,
  output              io_VSync,
  output              io_HSync,
  input               Core17_clk,
  input               Core17_reset,
  input               _zz_1
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
  reg        [3:0]    _zz_when_ClockDomain_l369;
  wire                when_ClockDomain_l369;
  reg                 when_ClockDomain_l369_regNext;
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
    io_Clear = 1'b1; // @[Spinal1861.scala 36:14]
    if(when_Spinal1861_l54) begin
      io_Clear = 1'b0; // @[Spinal1861.scala 58:18]
    end
  end

  always @(*) begin
    lineCounter_willIncrement = 1'b0; // @[Utils.scala 536:23]
    if(MCycleCounter_willOverflow) begin
      lineCounter_willIncrement = 1'b1; // @[Utils.scala 540:41]
    end
  end

  always @(*) begin
    lineCounter_willClear = 1'b0; // @[Utils.scala 537:19]
    if(when_Spinal1861_l54) begin
      lineCounter_willClear = 1'b1; // @[Utils.scala 539:33]
    end
  end

  assign lineCounter_willOverflowIfInc = (lineCounter_value == 9'h106); // @[BaseType.scala 305:24]
  assign lineCounter_willOverflow = (lineCounter_willOverflowIfInc && lineCounter_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    if(lineCounter_willOverflow) begin
      lineCounter_valueNext = 9'h0; // @[Utils.scala 552:17]
    end else begin
      lineCounter_valueNext = (lineCounter_value + _zz_lineCounter_valueNext); // @[Utils.scala 554:17]
    end
    if(lineCounter_willClear) begin
      lineCounter_valueNext = 9'h0; // @[Utils.scala 558:15]
    end
  end

  always @(*) begin
    MCycleCounter_willIncrement = 1'b0; // @[Utils.scala 536:23]
    if(when_Spinal1861_l67) begin
      MCycleCounter_willIncrement = 1'b1; // @[Utils.scala 540:41]
    end
  end

  always @(*) begin
    MCycleCounter_willClear = 1'b0; // @[Utils.scala 537:19]
    if(when_Spinal1861_l54) begin
      MCycleCounter_willClear = 1'b1; // @[Utils.scala 539:33]
    end
  end

  assign MCycleCounter_willOverflowIfInc = (MCycleCounter_value == 5'h1b); // @[BaseType.scala 305:24]
  assign MCycleCounter_willOverflow = (MCycleCounter_willOverflowIfInc && MCycleCounter_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    if(MCycleCounter_willOverflow) begin
      MCycleCounter_valueNext = 5'h0; // @[Utils.scala 552:17]
    end else begin
      MCycleCounter_valueNext = (MCycleCounter_value + _zz_MCycleCounter_valueNext); // @[Utils.scala 554:17]
    end
    if(MCycleCounter_willClear) begin
      MCycleCounter_valueNext = 5'h0; // @[Utils.scala 558:15]
    end
  end

  always @(*) begin
    syncCounter_willIncrement = 1'b0; // @[Utils.scala 536:23]
    if(when_Spinal1861_l61) begin
      syncCounter_willIncrement = 1'b1; // @[Utils.scala 540:41]
    end
  end

  always @(*) begin
    syncCounter_willClear = 1'b0; // @[Utils.scala 537:19]
    if(when_Spinal1861_l54) begin
      syncCounter_willClear = 1'b1; // @[Utils.scala 539:33]
    end
  end

  assign syncCounter_willOverflowIfInc = (syncCounter_value == 4'b1011); // @[BaseType.scala 305:24]
  assign syncCounter_willOverflow = (syncCounter_willOverflowIfInc && syncCounter_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    if(syncCounter_willOverflow) begin
      syncCounter_valueNext = 4'b0000; // @[Utils.scala 552:17]
    end else begin
      syncCounter_valueNext = (syncCounter_value + _zz_syncCounter_valueNext); // @[Utils.scala 554:17]
    end
    if(syncCounter_willClear) begin
      syncCounter_valueNext = 4'b0000; // @[Utils.scala 558:15]
    end
  end

  assign when_Spinal1861_l54 = (! io_Reset_); // @[BaseType.scala 299:24]
  assign when_Spinal1861_l61 = ((syncCounter_value != 4'b0000) || ((((MCycleCounter_value == 5'h1a) && (lineCounter_value == 9'h0)) && io_TPA) && (io_SC != 2'b00))); // @[BaseType.scala 305:24]
  assign io_Locked = (syncCounter_value == 4'b0000); // @[Spinal1861.scala 65:15]
  assign when_Spinal1861_l67 = ((io_TPB || io_TPA) && (syncCounter_value == 4'b0000)); // @[BaseType.scala 305:24]
  assign when_Spinal1861_l77 = (io_Disp_On && (! io_Disp_On_regNext)); // @[BaseType.scala 305:24]
  assign when_Spinal1861_l79 = ((io_Disp_Off && (! io_Disp_Off_regNext)) || (! io_Reset_)); // @[BaseType.scala 305:24]
  assign when_Spinal1861_l84 = (((lineCounter_value == 9'h04e) || (lineCounter_value == 9'h04f)) && DisplayOn); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_Spinal1861_l84) begin
      io_INT = 1'b0; // @[Spinal1861.scala 85:16]
    end else begin
      io_INT = 1'b1; // @[Spinal1861.scala 86:23]
    end
  end

  assign when_Spinal1861_l88 = (((9'h04c <= lineCounter_value) && (lineCounter_value <= 9'h04f)) || ((9'h0cd <= lineCounter_value) && (lineCounter_value <= 9'h0cf))); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_Spinal1861_l88) begin
      io_EFx = 1'b0; // @[Spinal1861.scala 89:16]
    end else begin
      io_EFx = 1'b1; // @[Spinal1861.scala 90:23]
    end
  end

  assign io_CompSync_ = (! (InvertedArea_HSync ^ InvertedArea_VSync)); // @[Spinal1861.scala 98:22]
  assign when_Spinal1861_l101 = (9'h010 <= lineCounter_value); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_Spinal1861_l101) begin
      InvertedArea_VSync = 1'b1; // @[Spinal1861.scala 102:19]
    end else begin
      InvertedArea_VSync = 1'b0; // @[Spinal1861.scala 103:28]
    end
  end

  assign when_Spinal1861_l106 = ((5'h03 <= MCycleCounter_value) || ((MCycleCounter_value == 5'h02) && io_TPA)); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_Spinal1861_l106) begin
      InvertedArea_HSync = 1'b1; // @[Spinal1861.scala 107:19]
    end else begin
      InvertedArea_HSync = 1'b0; // @[Spinal1861.scala 108:28]
    end
  end

  assign when_Spinal1861_l111 = ((((9'h050 <= lineCounter_value) && (lineCounter_value <= 9'h0cf)) && (((MCycleCounter_value == 5'h02) && io_TPA) || ((5'h03 <= MCycleCounter_value) && (MCycleCounter_value <= 5'h13)))) && DisplayOn); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_Spinal1861_l111) begin
      io_DMAO = 1'b0; // @[Spinal1861.scala 112:21]
    end else begin
      io_DMAO = 1'b1; // @[Spinal1861.scala 113:28]
    end
  end

  assign when_ClockDomain_l369 = (_zz_when_ClockDomain_l369 == 4'b1001); // @[BaseType.scala 305:24]
  assign when_Spinal1861_l118 = ((io_SC == 2'b10) && io_TPB); // @[BaseType.scala 305:24]
  assign when_Spinal1861_l120 = (! io_Reset_); // @[BaseType.scala 299:24]
  assign io_Video = InvertedArea_areaDiv_VideoShiftReg[7]; // @[Spinal1861.scala 124:22]
  assign io_VSync = InvertedArea_VSync; // @[Spinal1861.scala 139:18]
  assign io_HSync = (! InvertedArea_HSync); // @[Spinal1861.scala 140:18]
  always @(posedge Core17_clk) begin
    if(_zz_1) begin
      if(Core17_reset) begin
      lineCounter_value <= 9'h0; // @[Data.scala 400:33]
      MCycleCounter_value <= 5'h0; // @[Data.scala 400:33]
      syncCounter_value <= 4'b0000; // @[Data.scala 400:33]
      DisplayOn <= 1'b0; // @[Data.scala 400:33]
      end else begin
        lineCounter_value <= lineCounter_valueNext; // @[Reg.scala 39:30]
        MCycleCounter_value <= MCycleCounter_valueNext; // @[Reg.scala 39:30]
        syncCounter_value <= syncCounter_valueNext; // @[Reg.scala 39:30]
        if(when_Spinal1861_l77) begin
          DisplayOn <= 1'b1; // @[Spinal1861.scala 78:19]
        end else begin
          if(when_Spinal1861_l79) begin
            DisplayOn <= 1'b0; // @[Spinal1861.scala 80:19]
          end
        end
      end
    end
  end

  always @(posedge Core17_clk) begin
    if(_zz_1) begin
      io_Disp_On_regNext <= io_Disp_On; // @[Reg.scala 39:30]
      io_Disp_Off_regNext <= io_Disp_Off; // @[Reg.scala 39:30]
    end
  end

  always @(negedge Core17_clk or posedge Core17_reset) begin
    if(Core17_reset) begin
      _zz_when_ClockDomain_l369 <= 4'b0000; // @[Data.scala 400:33]
      when_ClockDomain_l369_regNext <= 1'b0; // @[Data.scala 400:33]
    end else begin
      _zz_when_ClockDomain_l369 <= (_zz_when_ClockDomain_l369 + 4'b0001); // @[ClockDomain.scala 368:15]
      if(when_ClockDomain_l369) begin
        _zz_when_ClockDomain_l369 <= 4'b0000; // @[ClockDomain.scala 370:17]
      end
      when_ClockDomain_l369_regNext <= when_ClockDomain_l369; // @[Reg.scala 39:30]
    end
  end

  always @(negedge Core17_clk or posedge Core17_reset) begin
    if(Core17_reset) begin
      InvertedArea_areaDiv_VideoShiftReg <= 8'h0; // @[Data.scala 400:33]
    end else begin
      if(when_ClockDomain_l369_regNext) begin
        if(when_Spinal1861_l118) begin
          InvertedArea_areaDiv_VideoShiftReg <= io_DataIn; // @[Spinal1861.scala 119:31]
        end else begin
          if(when_Spinal1861_l120) begin
            InvertedArea_areaDiv_VideoShiftReg <= 8'h0; // @[Spinal1861.scala 121:31]
          end else begin
            InvertedArea_areaDiv_VideoShiftReg <= (InvertedArea_areaDiv_VideoShiftReg <<< 1); // @[Spinal1861.scala 122:40]
          end
        end
      end
    end
  end


endmodule

module Spinal1802 (
  input               io_Wait_n,
  input               io_Clear_n,
  input               io_DMA_In_n,
  input               io_DMA_Out_n,
  input               io_Interrupt_n,
  input      [3:0]    io_EF_n,
  output              io_Q,
  output     [1:0]    io_SC,
  output     [2:0]    io_N,
  output              io_TPA,
  output              io_TPB,
  output              io_MRD,
  output              io_MWR,
  output reg [7:0]    io_Addr,
  output     [15:0]   io_Addr16,
  input      [7:0]    io_DataIn,
  output     [7:0]    io_DataOut,
  input               Core17_clk,
  input               Core17_reset,
  input               _zz_1_1
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
    StateCounter_willIncrement = 1'b0; // @[Utils.scala 536:23]
    if(when_Spinal1802_l124) begin
      StateCounter_willIncrement = 1'b1; // @[Utils.scala 540:41]
    end
  end

  always @(*) begin
    StateCounter_willClear = 1'b0; // @[Utils.scala 537:19]
    case(CoreFMS_stateReg)
      CoreFMS_enumDef_S1_Reset : begin
      end
      CoreFMS_enumDef_S1_Init : begin
        StateCounter_willClear = 1'b1; // @[Utils.scala 539:33]
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

  assign StateCounter_willOverflowIfInc = (StateCounter_value == 3'b111); // @[BaseType.scala 305:24]
  assign StateCounter_willOverflow = (StateCounter_willOverflowIfInc && StateCounter_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    StateCounter_valueNext = (StateCounter_value + _zz_StateCounter_valueNext); // @[Utils.scala 548:15]
    if(StateCounter_willClear) begin
      StateCounter_valueNext = 3'b000; // @[Utils.scala 558:15]
    end
  end

  always @(*) begin
    Reset = 1'b0; // @[Spinal1802.scala 90:17]
    case(CoreFMS_stateReg)
      CoreFMS_enumDef_S1_Reset : begin
      end
      CoreFMS_enumDef_S1_Init : begin
        Reset = 1'b1; // @[Spinal1802.scala 318:23]
      end
      CoreFMS_enumDef_S0_Fetch : begin
        Reset = 1'b0; // @[Spinal1802.scala 341:23]
      end
      CoreFMS_enumDef_S1_Execute : begin
        Reset = 1'b0; // @[Spinal1802.scala 453:23]
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
    Branch = 1'b0; // @[Spinal1802.scala 91:18]
    if(when_Spinal1802_l275) begin
      Branch = 1'b1; // @[Spinal1802.scala 276:16]
    end else begin
      if(when_Spinal1802_l277) begin
        Branch = (Q == 1'b1); // @[Spinal1802.scala 278:16]
      end else begin
        if(when_Spinal1802_l279) begin
          Branch = (D == 8'h0); // @[Spinal1802.scala 280:16]
        end else begin
          if(when_Spinal1802_l281) begin
            Branch = (DF == 1'b1); // @[Spinal1802.scala 282:16]
          end else begin
            if(when_Spinal1802_l283) begin
              Branch = (Q == 1'b0); // @[Spinal1802.scala 284:16]
            end else begin
              if(when_Spinal1802_l285) begin
                Branch = (D != 8'h0); // @[Spinal1802.scala 286:16]
              end else begin
                if(when_Spinal1802_l287) begin
                  Branch = (DF == 1'b0); // @[Spinal1802.scala 288:16]
                end else begin
                  if(when_Spinal1802_l289) begin
                    Branch = (IE == 1'b0); // @[Spinal1802.scala 290:16]
                  end else begin
                    if(when_Spinal1802_l291) begin
                      Branch = (EF[N[1 : 0]] == 1'b1); // @[Spinal1802.scala 292:16]
                    end else begin
                      if(when_Spinal1802_l293) begin
                        Branch = (EF[N[1 : 0]] == 1'b0); // @[Spinal1802.scala 294:16]
                      end else begin
                        Branch = 1'b0; // @[Spinal1802.scala 295:23]
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

  assign Skip = (((((((((N == 4'b0100) || (N == 4'b0101)) || (N == 4'b0110)) || (N == 4'b0111)) || (N == 4'b1000)) || (N == 4'b1100)) || (N == 4'b1101)) || (N == 4'b1110)) || (N == 4'b1111)); // @[BaseType.scala 305:24]
  assign _zz_A = _zz__zz_A; // @[Vec.scala 202:25]
  assign _zz_1 = ({15'd0,1'b1} <<< RSel); // @[BaseType.scala 299:24]
  assign _zz_2 = _zz_1[0]; // @[BaseType.scala 305:24]
  assign _zz_3 = _zz_1[1]; // @[BaseType.scala 305:24]
  assign _zz_4 = _zz_1[2]; // @[BaseType.scala 305:24]
  assign _zz_5 = _zz_1[3]; // @[BaseType.scala 305:24]
  assign _zz_6 = _zz_1[4]; // @[BaseType.scala 305:24]
  assign _zz_7 = _zz_1[5]; // @[BaseType.scala 305:24]
  assign _zz_8 = _zz_1[6]; // @[BaseType.scala 305:24]
  assign _zz_9 = _zz_1[7]; // @[BaseType.scala 305:24]
  assign _zz_10 = _zz_1[8]; // @[BaseType.scala 305:24]
  assign _zz_11 = _zz_1[9]; // @[BaseType.scala 305:24]
  assign _zz_12 = _zz_1[10]; // @[BaseType.scala 305:24]
  assign _zz_13 = _zz_1[11]; // @[BaseType.scala 305:24]
  assign _zz_14 = _zz_1[12]; // @[BaseType.scala 305:24]
  assign _zz_15 = _zz_1[13]; // @[BaseType.scala 305:24]
  assign _zz_16 = _zz_1[14]; // @[BaseType.scala 305:24]
  assign _zz_17 = _zz_1[15]; // @[BaseType.scala 305:24]
  assign A = _zz_A; // @[Spinal1802.scala 110:7]
  assign io_Q = Q; // @[Spinal1802.scala 113:10]
  assign io_SC = SC; // @[Spinal1802.scala 114:11]
  assign io_N = outN; // @[Spinal1802.scala 115:10]
  assign io_TPA = TPA; // @[Spinal1802.scala 116:12]
  assign io_TPB = TPB; // @[Spinal1802.scala 117:12]
  assign io_MRD = MRD; // @[Spinal1802.scala 118:12]
  assign io_MWR = MWR; // @[Spinal1802.scala 119:12]
  assign io_DataOut = Bus_1; // @[Spinal1802.scala 120:16]
  assign io_Addr16 = Addr16; // @[Spinal1802.scala 121:15]
  assign when_Spinal1802_l124 = (StartCounting && (Mode != CPUModes_Pause)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l129 = ((! io_Clear_n) && (! io_Wait_n)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l131 = ((! io_Clear_n) && io_Wait_n); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l133 = (io_Clear_n && (! io_Wait_n)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l138 = ((StateCounter_value == 3'b001) && (Mode != CPUModes_Reset)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l142 = ((StateCounter_value == 3'b110) && (Mode != CPUModes_Reset)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l147 = (RegSelMode == RegSelectModes_NSel); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_Spinal1802_l147) begin
      RSel = N; // @[Spinal1802.scala 148:14]
    end else begin
      if(when_Spinal1802_l149) begin
        RSel = X; // @[Spinal1802.scala 150:14]
      end else begin
        if(when_Spinal1802_l151) begin
          RSel = 4'b0010; // @[Spinal1802.scala 152:14]
        end else begin
          if(when_Spinal1802_l153) begin
            RSel = 4'b0000; // @[Spinal1802.scala 154:14]
          end else begin
            RSel = P; // @[Spinal1802.scala 155:23]
          end
        end
      end
    end
  end

  assign when_Spinal1802_l149 = (RegSelMode == RegSelectModes_XSel); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l151 = (RegSelMode == RegSelectModes_Stack2); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l153 = (RegSelMode == RegSelectModes_DMA0); // @[BaseType.scala 305:24]
  assign _zz_R_0 = (A + 16'h0001); // @[BaseType.scala 299:24]
  assign _zz_R_0_1 = (A - 16'h0001); // @[BaseType.scala 299:24]
  assign _zz_R_0_2 = {Bus_1,_zz_A[7 : 0]}; // @[BaseType.scala 318:22]
  assign _zz_R_0_3 = {_zz_A[15 : 8],Bus_1}; // @[BaseType.scala 318:22]
  assign _zz_R_0_4 = {TmpUpper,Bus_1}; // @[BaseType.scala 318:22]
  assign when_Spinal1802_l160 = (RegOpMode == RegOperationModes_Inc); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l162 = (RegOpMode == RegOperationModes_Dec); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l164 = (RegOpMode == RegOperationModes_LoadUpper); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l166 = (RegOpMode == RegOperationModes_LoadLower); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l168 = (RegOpMode == RegOperationModes_LoadTemp); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l170 = (RegOpMode == RegOperationModes_LoadJump); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l177 = (StateCounter_value == 3'b000); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l181 = ((3'b001 <= StateCounter_value) && (StateCounter_value <= 3'b010)); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_Spinal1802_l181) begin
      io_Addr = Addr[15 : 8]; // @[Spinal1802.scala 182:17]
    end else begin
      io_Addr = Addr[7 : 0]; // @[Spinal1802.scala 183:25]
    end
  end

  assign when_Spinal1802_l186 = (3'b011 <= StateCounter_value); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l187 = (SC == 2'b00); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l189 = (((SC == 2'b01) || (SC == 2'b10)) && (((((((ExeMode == _zz_when_Spinal1802_l189) || (ExeMode == _zz_when_Spinal1802_l189_1)) || (ExeMode == ExecuteModes_LoadDec)) || (ExeMode == ExecuteModes_LoadNoInc)) || (ExeMode == ExecuteModes_LongLoad)) || (ExeMode == ExecuteModes_LongContinue)) || (ExeMode == ExecuteModes_DMA_Out))); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l199 = ((3'b101 <= StateCounter_value) && (StateCounter_value < 3'b111)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l203 = (((SC == 2'b01) || (SC == 2'b10)) && ((((ExeMode == ExecuteModes_Write) || (ExeMode == ExecuteModes_WriteDec)) || (ExeMode == ExecuteModes_WriteNoInc)) || (ExeMode == ExecuteModes_DMA_In))); // @[BaseType.scala 305:24]
  assign ALU_Add = (_zz_ALU_Add + _zz_ALU_Add_1); // @[Spinal1802.scala 209:13]
  assign ALU_AddCarry = (ALU_Add + {8'h0,DF}); // @[Spinal1802.scala 210:18]
  assign ALU_SubD = (_zz_ALU_SubD - _zz_ALU_SubD_1); // @[Spinal1802.scala 211:14]
  assign ALU_SubM = (_zz_ALU_SubM - _zz_ALU_SubM_1); // @[Spinal1802.scala 212:14]
  assign ALU_SubDB = (ALU_SubD - {8'h0,(! DF)}); // @[Spinal1802.scala 213:15]
  assign ALU_SubMB = (ALU_SubM - {8'h0,(! DF)}); // @[Spinal1802.scala 214:15]
  assign when_Spinal1802_l219 = (DRegControl == DRegControlModes_BusIn); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l221 = (DRegControl == DRegControlModes_ALU_OR); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l223 = (DRegControl == DRegControlModes_ALU_XOR); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l225 = (DRegControl == DRegControlModes_ALU_AND); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l227 = (DRegControl == DRegControlModes_ALU_RSH); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l230 = (DRegControl == DRegControlModes_ALU_RSHR); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l233 = (DRegControl == DRegControlModes_ALU_LSH); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l236 = (DRegControl == DRegControlModes_ALU_LSHR); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l239 = (DRegControl == DRegControlModes_ALU_Add); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l242 = (DRegControl == DRegControlModes_ALU_AddCarry); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l245 = (DRegControl == DRegControlModes_ALU_SubD); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l248 = (DRegControl == DRegControlModes_ALU_SubM); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l251 = (DRegControl == DRegControlModes_ALU_SubDBorrow); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l254 = (DRegControl == DRegControlModes_ALU_SubMBorrow); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l260 = (BusControl == BusControlModes_DataIn); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_Spinal1802_l260) begin
      Bus_1 = io_DataIn; // @[Spinal1802.scala 261:13]
    end else begin
      if(when_Spinal1802_l262) begin
        Bus_1 = D; // @[Spinal1802.scala 263:13]
      end else begin
        if(when_Spinal1802_l264) begin
          Bus_1 = T; // @[Spinal1802.scala 265:13]
        end else begin
          if(when_Spinal1802_l266) begin
            Bus_1 = {X,P}; // @[Spinal1802.scala 267:13]
          end else begin
            if(when_Spinal1802_l268) begin
              Bus_1 = A[7 : 0]; // @[Spinal1802.scala 269:13]
            end else begin
              if(when_Spinal1802_l270) begin
                Bus_1 = A[15 : 8]; // @[Spinal1802.scala 271:13]
              end else begin
                Bus_1 = 8'h0; // @[Spinal1802.scala 272:21]
              end
            end
          end
        end
      end
    end
  end

  assign when_Spinal1802_l262 = (BusControl == BusControlModes_DReg); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l264 = (BusControl == BusControlModes_TReg); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l266 = (BusControl == BusControlModes_PXReg); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l268 = (BusControl == BusControlModes_RLower); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l270 = (BusControl == BusControlModes_RUpper); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l275 = ((N == 4'b0000) || (OP == 8'hc4)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l277 = (((N == 4'b0001) || (OP == 8'hc5)) || (OP == 8'hc1)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l279 = (((N == 4'b0010) || (OP == 8'hc6)) || (OP == 8'hc2)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l281 = (((N == 4'b0011) || (OP == 8'hc7)) || (OP == 8'hc3)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l283 = (((N == 4'b1001) || (OP == 8'hcd)) || (OP == 8'hc9)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l285 = (((N == 4'b1010) || (OP == 8'hce)) || (OP == 8'hca)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l287 = (((N == 4'b1011) || (OP == 8'hcf)) || (OP == 8'hcb)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l289 = (OP == 8'hcc); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l291 = ((I == 4'b0011) && ((((N == 4'b0100) || (N == 4'b0101)) || (N == 4'b0110)) || (N == 4'b0111))); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l293 = ((I == 4'b0011) && ((((N == 4'b1100) || (N == 4'b1101)) || (N == 4'b1110)) || (N == 4'b1111))); // @[BaseType.scala 305:24]
  assign CoreFMS_wantExit = 1'b0; // @[StateMachine.scala 151:28]
  always @(*) begin
    CoreFMS_wantStart = 1'b0; // @[StateMachine.scala 152:19]
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
        CoreFMS_wantStart = 1'b1; // @[StateMachine.scala 362:15]
      end
    endcase
  end

  assign CoreFMS_wantKill = 1'b0; // @[StateMachine.scala 153:18]
  always @(*) begin
    CoreFMS_stateNext = CoreFMS_stateReg; // @[StateMachine.scala 217:17]
    case(CoreFMS_stateReg)
      CoreFMS_enumDef_S1_Reset : begin
        if(when_Spinal1802_l304) begin
          CoreFMS_stateNext = CoreFMS_enumDef_S1_Init; // @[Enum.scala 148:67]
        end
      end
      CoreFMS_enumDef_S1_Init : begin
        if(when_State_l238) begin
          if(when_Spinal1802_l333) begin
            CoreFMS_stateNext = CoreFMS_enumDef_S1_Execute; // @[Enum.scala 148:67]
          end else begin
            CoreFMS_stateNext = CoreFMS_enumDef_S0_Fetch; // @[Enum.scala 148:67]
          end
        end
      end
      CoreFMS_enumDef_S0_Fetch : begin
        if(when_Spinal1802_l443) begin
          CoreFMS_stateNext = CoreFMS_enumDef_S1_Reset; // @[Enum.scala 148:67]
        end else begin
          if(StateCounter_willOverflow) begin
            CoreFMS_stateNext = CoreFMS_enumDef_S1_Execute; // @[Enum.scala 148:67]
          end
        end
      end
      CoreFMS_enumDef_S1_Execute : begin
        if(when_Spinal1802_l621) begin
          CoreFMS_stateNext = CoreFMS_enumDef_S1_Reset; // @[Enum.scala 148:67]
        end else begin
          if(StateCounter_willOverflow) begin
            if(when_Spinal1802_l625) begin
              CoreFMS_stateNext = CoreFMS_enumDef_S2_DMA; // @[Enum.scala 148:67]
            end else begin
              if(when_Spinal1802_l629) begin
                CoreFMS_stateNext = CoreFMS_enumDef_S2_DMA; // @[Enum.scala 148:67]
              end else begin
                if(when_Spinal1802_l633) begin
                  CoreFMS_stateNext = CoreFMS_enumDef_S3_INT; // @[Enum.scala 148:67]
                end else begin
                  if(!when_Spinal1802_l636) begin
                    if(when_Spinal1802_l639) begin
                      CoreFMS_stateNext = CoreFMS_enumDef_S0_Fetch; // @[Enum.scala 148:67]
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
          CoreFMS_stateNext = CoreFMS_enumDef_S1_Reset; // @[Enum.scala 148:67]
        end else begin
          if(StateCounter_willOverflow) begin
            if(when_Spinal1802_l666) begin
              if(when_Spinal1802_l668) begin
                CoreFMS_stateNext = CoreFMS_enumDef_S1_Execute; // @[Enum.scala 148:67]
              end else begin
                CoreFMS_stateNext = CoreFMS_enumDef_S0_Fetch; // @[Enum.scala 148:67]
              end
            end
          end
        end
      end
      CoreFMS_enumDef_S3_INT : begin
        if(when_Spinal1802_l693) begin
          CoreFMS_stateNext = CoreFMS_enumDef_S1_Reset; // @[Enum.scala 148:67]
        end else begin
          if(StateCounter_willOverflow) begin
            if(when_Spinal1802_l697) begin
              CoreFMS_stateNext = CoreFMS_enumDef_S2_DMA; // @[Enum.scala 148:67]
            end else begin
              if(when_Spinal1802_l700) begin
                CoreFMS_stateNext = CoreFMS_enumDef_S2_DMA; // @[Enum.scala 148:67]
              end else begin
                CoreFMS_stateNext = CoreFMS_enumDef_S0_Fetch; // @[Enum.scala 148:67]
              end
            end
          end
        end
      end
      default : begin
      end
    endcase
    if(CoreFMS_wantStart) begin
      CoreFMS_stateNext = CoreFMS_enumDef_S1_Reset; // @[Enum.scala 148:67]
    end
    if(CoreFMS_wantKill) begin
      CoreFMS_stateNext = CoreFMS_enumDef_BOOT; // @[Enum.scala 148:67]
    end
  end

  assign when_Spinal1802_l304 = (Mode != CPUModes_Reset); // @[BaseType.scala 305:24]
  assign when_State_l238 = (_zz_when_State_l238 <= 4'b0001); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l333 = (Mode == CPUModes_Load); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l344 = (StateCounter_value == 3'b000); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l349 = (StateCounter_value == 3'b001); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l352 = (StateCounter_value == 3'b010); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l355 = (StateCounter_value == 3'b110); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l360 = (StateCounter_value == 3'b111); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l363 = (N == 4'b0000); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l367 = (4'b0001 <= N); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l391 = ((4'b0000 < N) && (N <= 4'b0111)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l393 = (4'b1001 <= N); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l398 = (((N == 4'b0000) || (N == 4'b0001)) || (N == 4'b0010)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l401 = (N == 4'b0011); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l404 = (((N == 4'b0100) || (N == 4'b0101)) || (N == 4'b0111)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l407 = (N == 4'b1000); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l410 = (N == 4'b1001); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l414 = (((N == 4'b1100) || (N == 4'b1101)) || (N == 4'b1111)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l434 = ((N <= 4'b0101) || (N == 4'b0111)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l437 = (((4'b1000 <= N) && (N <= 4'b1101)) || (N == 4'b1111)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l443 = (Mode == CPUModes_Reset); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l456 = (StateCounter_value == 3'b001); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l458 = (((ExeMode == ExecuteModes_Load) || (ExeMode == ExecuteModes_Write)) || (ExeMode == ExecuteModes_LongLoad)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l460 = (((ExeMode == ExecuteModes_LoadDec) || (ExeMode == ExecuteModes_WriteDec)) || (ExeMode == ExecuteModes_LongContinue)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l464 = ((I == 4'b0110) && (4'b0000 < N)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l469 = (StateCounter_value == 3'b010); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l473 = (StateCounter_value == 3'b100); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l479 = ((N == 4'b1000) || (N == 4'b1001)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l481 = (N == 4'b0011); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l488 = (StateCounter_value == 3'b101); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l491 = (N != 4'b0000); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l506 = (N == 4'b0000); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l508 = (4'b1001 <= N); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l513 = ((N == 4'b0000) || (N == 4'b0001)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l517 = (N == 4'b0010); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l519 = ((N == 4'b0100) || (N == 4'b1100)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l521 = ((N == 4'b0101) || (N == 4'b1101)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l523 = (N == 4'b0110); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l525 = ((N == 4'b0111) || (N == 4'b1111)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l527 = (N == 4'b1010); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l529 = (N == 4'b1011); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l531 = (N == 4'b1110); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l554 = (ExeMode == ExecuteModes_Load); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l555 = (Branch && (! Skip)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l558 = (((ExeMode == ExecuteModes_LongLoad) && Branch) && (! Skip)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l572 = (N == 4'b0000); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l574 = ((N == 4'b0001) || (N == 4'b1001)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l576 = ((N == 4'b0010) || (N == 4'b1010)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l578 = ((N == 4'b0011) || (N == 4'b1011)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l580 = ((N == 4'b0100) || (N == 4'b1100)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l582 = ((N == 4'b0101) || (N == 4'b1101)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l584 = (N == 4'b0110); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l586 = ((N == 4'b0111) || (N == 4'b1111)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l588 = (N == 4'b1000); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l590 = (N == 4'b1110); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l597 = (StateCounter_value == 3'b110); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l598 = ((I == 4'b0111) && (N == 4'b1001)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l602 = ((ExeMode == ExecuteModes_LongLoad) || (ExeMode == ExecuteModes_LongContinue)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l604 = ((I == 4'b1100) && ((RegOpMode == RegOperationModes_LoadTemp) || (Skip && (! Branch)))); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l606 = (((I == 4'b1100) && Skip) && Branch); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l608 = (((I == 4'b1100) && (! Skip)) && (! Branch)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l621 = (Mode == CPUModes_Reset); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l625 = (! io_DMA_In_n); // @[BaseType.scala 299:24]
  assign when_Spinal1802_l639 = ((! ((ExeMode == ExecuteModes_LongLoad) || (ExeMode == ExecuteModes_LongContinue))) && (! Idle)); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l629 = (! io_DMA_Out_n); // @[BaseType.scala 299:24]
  assign when_Spinal1802_l633 = (((! io_Interrupt_n) && IE) && (! ((ExeMode == ExecuteModes_LongLoad) || (ExeMode == ExecuteModes_LongContinue)))); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l636 = (Mode == CPUModes_Load); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l651 = (StateCounter_value == 3'b000); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l656 = (StateCounter_value == 3'b001); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l660 = (StateCounter_value == 3'b010); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l663 = (Mode == CPUModes_Reset); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l666 = (io_DMA_In_n && io_DMA_Out_n); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l668 = (Mode == CPUModes_Load); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l684 = (StateCounter_value == 3'b010); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l688 = (StateCounter_value == 3'b011); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l693 = (Mode == CPUModes_Reset); // @[BaseType.scala 305:24]
  assign when_Spinal1802_l697 = (! io_DMA_In_n); // @[BaseType.scala 299:24]
  assign when_Spinal1802_l700 = (! io_DMA_Out_n); // @[BaseType.scala 299:24]
  assign when_StateMachine_l253 = ((! (CoreFMS_stateReg == CoreFMS_enumDef_S1_Init)) && (CoreFMS_stateNext == CoreFMS_enumDef_S1_Init)); // @[BaseType.scala 305:24]
  always @(posedge Core17_clk) begin
    if(_zz_1_1) begin
      if(Core17_reset) begin
      Q <= 1'b0; // @[Data.scala 400:33]
      TPA <= 1'b0; // @[Data.scala 400:33]
      TPB <= 1'b0; // @[Data.scala 400:33]
      MRD <= 1'b1; // @[Data.scala 400:33]
      MWR <= 1'b1; // @[Data.scala 400:33]
      StateCounter_value <= 3'b000; // @[Data.scala 400:33]
      StartCounting <= 1'b0; // @[Data.scala 400:33]
      Addr <= 16'h0; // @[Data.scala 400:33]
      Addr16 <= 16'h0; // @[Data.scala 400:33]
      D <= 8'h0; // @[Data.scala 400:33]
      outN <= 3'b000; // @[Data.scala 400:33]
      T <= 8'h0; // @[Data.scala 400:33]
      IE <= 1'b1; // @[Data.scala 400:33]
      DF <= 1'b0; // @[Data.scala 400:33]
      Idle <= 1'b0; // @[Data.scala 400:33]
      CoreFMS_stateReg <= CoreFMS_enumDef_BOOT; // @[Data.scala 400:33]
      end else begin
        StateCounter_value <= StateCounter_valueNext; // @[Reg.scala 39:30]
        Addr16 <= Addr; // @[Reg.scala 39:30]
        if(when_Spinal1802_l138) begin
          TPA <= 1'b1; // @[Spinal1802.scala 139:13]
        end else begin
          TPA <= 1'b0; // @[Spinal1802.scala 140:22]
        end
        if(when_Spinal1802_l142) begin
          TPB <= 1'b1; // @[Spinal1802.scala 143:13]
        end else begin
          TPB <= 1'b0; // @[Spinal1802.scala 144:22]
        end
        if(Reset) begin
          Addr <= 16'h0; // @[Spinal1802.scala 176:14]
        end else begin
          if(when_Spinal1802_l177) begin
            Addr <= A; // @[Spinal1802.scala 178:14]
          end
        end
        if(when_Spinal1802_l186) begin
          if(when_Spinal1802_l187) begin
            MRD <= 1'b0; // @[Spinal1802.scala 188:17]
          end else begin
            if(when_Spinal1802_l189) begin
              MRD <= 1'b0; // @[Spinal1802.scala 194:17]
            end
          end
        end else begin
          MRD <= 1'b1; // @[Spinal1802.scala 196:21]
        end
        if(when_Spinal1802_l199) begin
          if(when_Spinal1802_l203) begin
            MWR <= 1'b0; // @[Spinal1802.scala 204:17]
          end
        end else begin
          MWR <= 1'b1; // @[Spinal1802.scala 206:21]
        end
        if(Reset) begin
          DF <= 1'b0; // @[Spinal1802.scala 217:12]
          D <= 8'h0; // @[Spinal1802.scala 218:11]
        end else begin
          if(when_Spinal1802_l219) begin
            D <= Bus_1; // @[Spinal1802.scala 220:11]
          end else begin
            if(when_Spinal1802_l221) begin
              D <= (Bus_1 | D); // @[Spinal1802.scala 222:11]
            end else begin
              if(when_Spinal1802_l223) begin
                D <= (Bus_1 ^ D); // @[Spinal1802.scala 224:11]
              end else begin
                if(when_Spinal1802_l225) begin
                  D <= (Bus_1 & D); // @[Spinal1802.scala 226:11]
                end else begin
                  if(when_Spinal1802_l227) begin
                    DF <= Dlast[0]; // @[Spinal1802.scala 228:12]
                    D <= (D >>> 1); // @[Spinal1802.scala 229:11]
                  end else begin
                    if(when_Spinal1802_l230) begin
                      DF <= Dlast[0]; // @[Spinal1802.scala 231:12]
                      D <= (_zz_D | {DFLast,7'h0}); // @[Spinal1802.scala 232:11]
                    end else begin
                      if(when_Spinal1802_l233) begin
                        DF <= Dlast[7]; // @[Spinal1802.scala 234:12]
                        D <= (D <<< 1); // @[Spinal1802.scala 235:11]
                      end else begin
                        if(when_Spinal1802_l236) begin
                          DF <= Dlast[7]; // @[Spinal1802.scala 237:12]
                          D <= (_zz_D_1 | {7'h0,DFLast}); // @[Spinal1802.scala 238:11]
                        end else begin
                          if(when_Spinal1802_l239) begin
                            DF <= ALU_Add[8]; // @[Spinal1802.scala 240:12]
                            D <= ALU_Add[7:0]; // @[Spinal1802.scala 241:11]
                          end else begin
                            if(when_Spinal1802_l242) begin
                              DF <= ALU_AddCarry[8]; // @[Spinal1802.scala 243:12]
                              D <= ALU_AddCarry[7:0]; // @[Spinal1802.scala 244:11]
                            end else begin
                              if(when_Spinal1802_l245) begin
                                DF <= (! ALU_SubD[8]); // @[Spinal1802.scala 246:12]
                                D <= ALU_SubD[7:0]; // @[Spinal1802.scala 247:11]
                              end else begin
                                if(when_Spinal1802_l248) begin
                                  DF <= (! ALU_SubM[8]); // @[Spinal1802.scala 249:12]
                                  D <= ALU_SubM[7:0]; // @[Spinal1802.scala 250:11]
                                end else begin
                                  if(when_Spinal1802_l251) begin
                                    DF <= (! ALU_SubDB[8]); // @[Spinal1802.scala 252:12]
                                    D <= ALU_SubDB[7:0]; // @[Spinal1802.scala 253:11]
                                  end else begin
                                    if(when_Spinal1802_l254) begin
                                      DF <= (! ALU_SubMB[8]); // @[Spinal1802.scala 255:12]
                                      D <= ALU_SubMB[7:0]; // @[Spinal1802.scala 256:11]
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
        CoreFMS_stateReg <= CoreFMS_stateNext; // @[StateMachine.scala 212:14]
        case(CoreFMS_stateReg)
          CoreFMS_enumDef_S1_Reset : begin
          end
          CoreFMS_enumDef_S1_Init : begin
            Idle <= 1'b0; // @[Spinal1802.scala 319:22]
            IE <= 1'b1; // @[Spinal1802.scala 320:20]
            outN <= 3'b000; // @[Spinal1802.scala 321:22]
            T <= 8'h0; // @[Spinal1802.scala 322:19]
            Q <= 1'b0; // @[Spinal1802.scala 327:19]
            if(when_State_l238) begin
              StartCounting <= 1'b1; // @[Spinal1802.scala 332:31]
            end
          end
          CoreFMS_enumDef_S0_Fetch : begin
            if(when_Spinal1802_l360) begin
              case(I)
                4'b0000 : begin
                  if(when_Spinal1802_l363) begin
                    Idle <= 1'b1; // @[Spinal1802.scala 364:38]
                  end
                end
                4'b0111 : begin
                  if(!when_Spinal1802_l398) begin
                    if(!when_Spinal1802_l401) begin
                      if(!when_Spinal1802_l404) begin
                        if(!when_Spinal1802_l407) begin
                          if(when_Spinal1802_l410) begin
                            T <= {X,P}; // @[Spinal1802.scala 411:35]
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
                outN <= N[2:0]; // @[Spinal1802.scala 465:30]
              end
            end
            if(when_Spinal1802_l488) begin
              case(I)
                4'b0111 : begin
                  if(when_Spinal1802_l513) begin
                    IE <= (! N[0]); // @[Spinal1802.scala 514:36]
                  end else begin
                    if(!when_Spinal1802_l517) begin
                      if(!when_Spinal1802_l519) begin
                        if(!when_Spinal1802_l521) begin
                          if(!when_Spinal1802_l523) begin
                            if(!when_Spinal1802_l525) begin
                              if(when_Spinal1802_l527) begin
                                Q <= 1'b0; // @[Spinal1802.scala 528:35]
                              end else begin
                                if(when_Spinal1802_l529) begin
                                  Q <= 1'b1; // @[Spinal1802.scala 530:35]
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
                outN <= 3'b000; // @[Spinal1802.scala 624:26]
              end
            end
          end
          CoreFMS_enumDef_S2_DMA : begin
            if(!when_Spinal1802_l663) begin
              if(StateCounter_willOverflow) begin
                if(when_Spinal1802_l666) begin
                  if(!when_Spinal1802_l668) begin
                    Idle <= 1'b0; // @[Spinal1802.scala 671:34]
                  end
                end
              end
            end
          end
          CoreFMS_enumDef_S3_INT : begin
            if(when_Spinal1802_l684) begin
              T <= {X,P}; // @[Spinal1802.scala 685:23]
            end
            if(when_Spinal1802_l688) begin
              IE <= 1'b0; // @[Spinal1802.scala 691:24]
            end
            if(!when_Spinal1802_l693) begin
              if(StateCounter_willOverflow) begin
                Idle <= 1'b0; // @[Spinal1802.scala 696:26]
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
    if(_zz_1_1) begin
      Dlast <= D; // @[Reg.scala 39:30]
      EF <= (~ io_EF_n); // @[Reg.scala 39:30]
      DFLast <= DF; // @[Reg.scala 39:30]
      OP <= {I,N}; // @[Reg.scala 39:30]
      if(when_Spinal1802_l129) begin
        Mode <= CPUModes_Load; // @[Enum.scala 148:67]
      end else begin
        if(when_Spinal1802_l131) begin
          Mode <= CPUModes_Reset; // @[Enum.scala 148:67]
        end else begin
          if(when_Spinal1802_l133) begin
            Mode <= CPUModes_Pause; // @[Enum.scala 148:67]
          end else begin
            Mode <= CPUModes_Run; // @[Enum.scala 148:67]
          end
        end
      end
      if(Reset) begin
        R_0 <= 16'h0; // @[BitVector.scala 471:10]
      end else begin
        if(when_Spinal1802_l160) begin
          if(_zz_2) begin
            R_0 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_3) begin
            R_1 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_4) begin
            R_2 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_5) begin
            R_3 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_6) begin
            R_4 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_7) begin
            R_5 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_8) begin
            R_6 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_9) begin
            R_7 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_10) begin
            R_8 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_11) begin
            R_9 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_12) begin
            R_10 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_13) begin
            R_11 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_14) begin
            R_12 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_15) begin
            R_13 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_16) begin
            R_14 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
          if(_zz_17) begin
            R_15 <= _zz_R_0; // @[Spinal1802.scala 161:17]
          end
        end else begin
          if(when_Spinal1802_l162) begin
            if(_zz_2) begin
              R_0 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_3) begin
              R_1 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_4) begin
              R_2 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_5) begin
              R_3 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_6) begin
              R_4 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_7) begin
              R_5 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_8) begin
              R_6 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_9) begin
              R_7 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_10) begin
              R_8 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_11) begin
              R_9 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_12) begin
              R_10 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_13) begin
              R_11 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_14) begin
              R_12 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_15) begin
              R_13 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_16) begin
              R_14 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
            if(_zz_17) begin
              R_15 <= _zz_R_0_1; // @[Spinal1802.scala 163:17]
            end
          end else begin
            if(when_Spinal1802_l164) begin
              if(_zz_2) begin
                R_0 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_3) begin
                R_1 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_4) begin
                R_2 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_5) begin
                R_3 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_6) begin
                R_4 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_7) begin
                R_5 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_8) begin
                R_6 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_9) begin
                R_7 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_10) begin
                R_8 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_11) begin
                R_9 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_12) begin
                R_10 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_13) begin
                R_11 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_14) begin
                R_12 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_15) begin
                R_13 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_16) begin
                R_14 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
              if(_zz_17) begin
                R_15 <= _zz_R_0_2; // @[Spinal1802.scala 165:17]
              end
            end else begin
              if(when_Spinal1802_l166) begin
                if(_zz_2) begin
                  R_0 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_3) begin
                  R_1 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_4) begin
                  R_2 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_5) begin
                  R_3 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_6) begin
                  R_4 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_7) begin
                  R_5 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_8) begin
                  R_6 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_9) begin
                  R_7 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_10) begin
                  R_8 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_11) begin
                  R_9 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_12) begin
                  R_10 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_13) begin
                  R_11 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_14) begin
                  R_12 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_15) begin
                  R_13 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_16) begin
                  R_14 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
                if(_zz_17) begin
                  R_15 <= _zz_R_0_3; // @[Spinal1802.scala 167:17]
                end
              end else begin
                if(when_Spinal1802_l168) begin
                  TmpUpper <= Bus_1; // @[Spinal1802.scala 169:18]
                end else begin
                  if(when_Spinal1802_l170) begin
                    if(_zz_2) begin
                      R_0 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_3) begin
                      R_1 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_4) begin
                      R_2 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_5) begin
                      R_3 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_6) begin
                      R_4 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_7) begin
                      R_5 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_8) begin
                      R_6 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_9) begin
                      R_7 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_10) begin
                      R_8 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_11) begin
                      R_9 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_12) begin
                      R_10 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_13) begin
                      R_11 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_14) begin
                      R_12 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_15) begin
                      R_13 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_16) begin
                      R_14 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
                    end
                    if(_zz_17) begin
                      R_15 <= _zz_R_0_4; // @[Spinal1802.scala 171:17]
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
          SC <= 2'b01; // @[Spinal1802.scala 302:20]
        end
        CoreFMS_enumDef_S1_Init : begin
          ExeMode <= ExecuteModes_None; // @[Enum.scala 148:67]
          RegSelMode <= RegSelectModes_PSel; // @[Enum.scala 148:67]
          RegOpMode <= RegOperationModes_None; // @[Enum.scala 148:67]
          DRegControl <= DRegControlModes_None; // @[Enum.scala 148:67]
          BusControl <= BusControlModes_DataIn; // @[Enum.scala 148:67]
          P <= 4'b0000; // @[Spinal1802.scala 323:19]
          X <= 4'b0000; // @[Spinal1802.scala 324:19]
          I <= 4'b0000; // @[Spinal1802.scala 325:19]
          N <= 4'b0000; // @[Spinal1802.scala 326:19]
          SC <= 2'b01; // @[Spinal1802.scala 328:20]
          _zz_when_State_l238 <= (_zz_when_State_l238 - 4'b0001); // @[State.scala 237:17]
        end
        CoreFMS_enumDef_S0_Fetch : begin
          SC <= 2'b00; // @[Spinal1802.scala 342:20]
          if(when_Spinal1802_l344) begin
            ExeMode <= ExecuteModes_None; // @[Enum.scala 148:67]
            BusControl <= BusControlModes_DataIn; // @[Enum.scala 148:67]
            RegSelMode <= RegSelectModes_PSel; // @[Enum.scala 148:67]
          end
          if(when_Spinal1802_l349) begin
            RegOpMode <= RegOperationModes_Inc; // @[Enum.scala 148:67]
          end
          if(when_Spinal1802_l352) begin
            RegOpMode <= RegOperationModes_None; // @[Enum.scala 148:67]
          end
          if(when_Spinal1802_l355) begin
            I <= io_DataIn[7 : 4]; // @[Spinal1802.scala 356:23]
            N <= io_DataIn[3 : 0]; // @[Spinal1802.scala 357:23]
          end
          if(when_Spinal1802_l360) begin
            case(I)
              4'b0000 : begin
                if(when_Spinal1802_l363) begin
                  ExeMode <= ExecuteModes_LoadNoInc; // @[Enum.scala 148:67]
                  RegSelMode <= RegSelectModes_DMA0; // @[Enum.scala 148:67]
                end else begin
                  if(when_Spinal1802_l367) begin
                    ExeMode <= ExecuteModes_LoadNoInc; // @[Enum.scala 148:67]
                    RegSelMode <= RegSelectModes_NSel; // @[Enum.scala 148:67]
                  end
                end
              end
              4'b0001 : begin
                RegSelMode <= RegSelectModes_NSel; // @[Enum.scala 148:67]
              end
              4'b0010 : begin
                RegSelMode <= RegSelectModes_NSel; // @[Enum.scala 148:67]
              end
              4'b0011 : begin
                ExeMode <= ExecuteModes_Load; // @[Enum.scala 148:67]
              end
              4'b0100 : begin
                ExeMode <= ExecuteModes_Load; // @[Enum.scala 148:67]
                RegSelMode <= RegSelectModes_NSel; // @[Enum.scala 148:67]
              end
              4'b0101 : begin
                ExeMode <= ExecuteModes_WriteNoInc; // @[Enum.scala 148:67]
                RegSelMode <= RegSelectModes_NSel; // @[Enum.scala 148:67]
              end
              4'b0110 : begin
                RegSelMode <= RegSelectModes_XSel; // @[Enum.scala 148:67]
                if(when_Spinal1802_l391) begin
                  ExeMode <= ExecuteModes_Load; // @[Enum.scala 148:67]
                end else begin
                  if(when_Spinal1802_l393) begin
                    ExeMode <= ExecuteModes_WriteNoInc; // @[Enum.scala 148:67]
                  end
                end
              end
              4'b0111 : begin
                if(when_Spinal1802_l398) begin
                  RegSelMode <= RegSelectModes_XSel; // @[Enum.scala 148:67]
                  ExeMode <= ExecuteModes_Load; // @[Enum.scala 148:67]
                end else begin
                  if(when_Spinal1802_l401) begin
                    RegSelMode <= RegSelectModes_XSel; // @[Enum.scala 148:67]
                    ExeMode <= ExecuteModes_WriteDec; // @[Enum.scala 148:67]
                  end else begin
                    if(when_Spinal1802_l404) begin
                      RegSelMode <= RegSelectModes_XSel; // @[Enum.scala 148:67]
                      ExeMode <= ExecuteModes_LoadNoInc; // @[Enum.scala 148:67]
                    end else begin
                      if(when_Spinal1802_l407) begin
                        RegSelMode <= RegSelectModes_XSel; // @[Enum.scala 148:67]
                        ExeMode <= ExecuteModes_WriteNoInc; // @[Enum.scala 148:67]
                      end else begin
                        if(when_Spinal1802_l410) begin
                          RegSelMode <= RegSelectModes_Stack2; // @[Enum.scala 148:67]
                          ExeMode <= ExecuteModes_WriteDec; // @[Enum.scala 148:67]
                        end else begin
                          if(when_Spinal1802_l414) begin
                            ExeMode <= ExecuteModes_Load; // @[Enum.scala 148:67]
                          end
                        end
                      end
                    end
                  end
                end
              end
              4'b1000 : begin
                RegSelMode <= RegSelectModes_NSel; // @[Enum.scala 148:67]
              end
              4'b1001 : begin
                RegSelMode <= RegSelectModes_NSel; // @[Enum.scala 148:67]
              end
              4'b1010 : begin
                RegSelMode <= RegSelectModes_NSel; // @[Enum.scala 148:67]
              end
              4'b1011 : begin
                RegSelMode <= RegSelectModes_NSel; // @[Enum.scala 148:67]
              end
              4'b1100 : begin
                ExeMode <= ExecuteModes_Load; // @[Enum.scala 148:67]
              end
              4'b1111 : begin
                if(when_Spinal1802_l434) begin
                  RegSelMode <= RegSelectModes_XSel; // @[Enum.scala 148:67]
                  ExeMode <= ExecuteModes_LoadNoInc; // @[Enum.scala 148:67]
                end else begin
                  if(when_Spinal1802_l437) begin
                    ExeMode <= ExecuteModes_Load; // @[Enum.scala 148:67]
                  end
                end
              end
              default : begin
              end
            endcase
          end
        end
        CoreFMS_enumDef_S1_Execute : begin
          SC <= 2'b01; // @[Spinal1802.scala 454:20]
          if(when_Spinal1802_l456) begin
            if(when_Spinal1802_l458) begin
              RegOpMode <= RegOperationModes_Inc; // @[Enum.scala 148:67]
            end else begin
              if(when_Spinal1802_l460) begin
                RegOpMode <= RegOperationModes_Dec; // @[Enum.scala 148:67]
              end
            end
          end
          if(when_Spinal1802_l469) begin
            RegOpMode <= RegOperationModes_None; // @[Enum.scala 148:67]
          end
          if(when_Spinal1802_l473) begin
            case(I)
              4'b0101 : begin
                BusControl <= BusControlModes_DReg; // @[Enum.scala 148:67]
              end
              4'b0111 : begin
                if(when_Spinal1802_l479) begin
                  BusControl <= BusControlModes_TReg; // @[Enum.scala 148:67]
                end else begin
                  if(when_Spinal1802_l481) begin
                    BusControl <= BusControlModes_DReg; // @[Enum.scala 148:67]
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
                  DRegControl <= DRegControlModes_BusIn; // @[Enum.scala 148:67]
                end
              end
              4'b0001 : begin
                RegOpMode <= RegOperationModes_Inc; // @[Enum.scala 148:67]
              end
              4'b0010 : begin
                RegOpMode <= RegOperationModes_Dec; // @[Enum.scala 148:67]
              end
              4'b0011 : begin
                if(Branch) begin
                  RegOpMode <= RegOperationModes_LoadLower; // @[Enum.scala 148:67]
                end
              end
              4'b0100 : begin
                DRegControl <= DRegControlModes_BusIn; // @[Enum.scala 148:67]
              end
              4'b0110 : begin
                if(when_Spinal1802_l506) begin
                  RegOpMode <= RegOperationModes_Inc; // @[Enum.scala 148:67]
                end else begin
                  if(when_Spinal1802_l508) begin
                    DRegControl <= DRegControlModes_BusIn; // @[Enum.scala 148:67]
                  end
                end
              end
              4'b0111 : begin
                if(when_Spinal1802_l513) begin
                  X <= Bus_1[7 : 4]; // @[Spinal1802.scala 515:35]
                  P <= Bus_1[3 : 0]; // @[Spinal1802.scala 516:35]
                end else begin
                  if(when_Spinal1802_l517) begin
                    DRegControl <= DRegControlModes_BusIn; // @[Enum.scala 148:67]
                  end else begin
                    if(when_Spinal1802_l519) begin
                      DRegControl <= DRegControlModes_ALU_AddCarry; // @[Enum.scala 148:67]
                    end else begin
                      if(when_Spinal1802_l521) begin
                        DRegControl <= DRegControlModes_ALU_SubDBorrow; // @[Enum.scala 148:67]
                      end else begin
                        if(when_Spinal1802_l523) begin
                          DRegControl <= DRegControlModes_ALU_RSHR; // @[Enum.scala 148:67]
                        end else begin
                          if(when_Spinal1802_l525) begin
                            DRegControl <= DRegControlModes_ALU_SubMBorrow; // @[Enum.scala 148:67]
                          end else begin
                            if(!when_Spinal1802_l527) begin
                              if(!when_Spinal1802_l529) begin
                                if(when_Spinal1802_l531) begin
                                  DRegControl <= DRegControlModes_ALU_LSHR; // @[Enum.scala 148:67]
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
                BusControl <= BusControlModes_RLower; // @[Enum.scala 148:67]
                DRegControl <= DRegControlModes_BusIn; // @[Enum.scala 148:67]
              end
              4'b1001 : begin
                BusControl <= BusControlModes_RUpper; // @[Enum.scala 148:67]
                DRegControl <= DRegControlModes_BusIn; // @[Enum.scala 148:67]
              end
              4'b1010 : begin
                BusControl <= BusControlModes_DReg; // @[Enum.scala 148:67]
                RegOpMode <= RegOperationModes_LoadLower; // @[Enum.scala 148:67]
              end
              4'b1011 : begin
                BusControl <= BusControlModes_DReg; // @[Enum.scala 148:67]
                RegOpMode <= RegOperationModes_LoadUpper; // @[Enum.scala 148:67]
              end
              4'b1100 : begin
                if(when_Spinal1802_l554) begin
                  if(when_Spinal1802_l555) begin
                    RegOpMode <= RegOperationModes_LoadTemp; // @[Enum.scala 148:67]
                  end
                end else begin
                  if(when_Spinal1802_l558) begin
                    RegOpMode <= RegOperationModes_LoadJump; // @[Enum.scala 148:67]
                  end
                end
              end
              4'b1101 : begin
                P <= N; // @[Spinal1802.scala 564:31]
              end
              4'b1110 : begin
                X <= N; // @[Spinal1802.scala 568:31]
              end
              4'b1111 : begin
                if(when_Spinal1802_l572) begin
                  DRegControl <= DRegControlModes_BusIn; // @[Enum.scala 148:67]
                end else begin
                  if(when_Spinal1802_l574) begin
                    DRegControl <= DRegControlModes_ALU_OR; // @[Enum.scala 148:67]
                  end else begin
                    if(when_Spinal1802_l576) begin
                      DRegControl <= DRegControlModes_ALU_AND; // @[Enum.scala 148:67]
                    end else begin
                      if(when_Spinal1802_l578) begin
                        DRegControl <= DRegControlModes_ALU_XOR; // @[Enum.scala 148:67]
                      end else begin
                        if(when_Spinal1802_l580) begin
                          DRegControl <= DRegControlModes_ALU_Add; // @[Enum.scala 148:67]
                        end else begin
                          if(when_Spinal1802_l582) begin
                            DRegControl <= DRegControlModes_ALU_SubD; // @[Enum.scala 148:67]
                          end else begin
                            if(when_Spinal1802_l584) begin
                              DRegControl <= DRegControlModes_ALU_RSH; // @[Enum.scala 148:67]
                            end else begin
                              if(when_Spinal1802_l586) begin
                                DRegControl <= DRegControlModes_ALU_SubM; // @[Enum.scala 148:67]
                              end else begin
                                if(when_Spinal1802_l588) begin
                                  DRegControl <= DRegControlModes_BusIn; // @[Enum.scala 148:67]
                                end else begin
                                  if(when_Spinal1802_l590) begin
                                    DRegControl <= DRegControlModes_ALU_LSH; // @[Enum.scala 148:67]
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
              X <= P; // @[Spinal1802.scala 599:27]
            end
            if(when_Spinal1802_l602) begin
              ExeMode <= ExecuteModes_None; // @[Enum.scala 148:67]
            end else begin
              if(when_Spinal1802_l604) begin
                ExeMode <= ExecuteModes_LongLoad; // @[Enum.scala 148:67]
              end else begin
                if(when_Spinal1802_l606) begin
                  ExeMode <= ExecuteModes_LongContinue; // @[Enum.scala 148:67]
                end else begin
                  if(when_Spinal1802_l608) begin
                    ExeMode <= ExecuteModes_LongLoad; // @[Enum.scala 148:67]
                  end
                end
              end
            end
            if(Idle) begin
              RegSelMode <= RegSelectModes_DMA0; // @[Enum.scala 148:67]
            end else begin
              RegSelMode <= RegSelectModes_PSel; // @[Enum.scala 148:67]
              RegOpMode <= RegOperationModes_None; // @[Enum.scala 148:67]
              DRegControl <= DRegControlModes_None; // @[Enum.scala 148:67]
            end
          end
          if(!when_Spinal1802_l621) begin
            if(StateCounter_willOverflow) begin
              if(when_Spinal1802_l625) begin
                RegSelMode <= RegSelectModes_DMA0; // @[Enum.scala 148:67]
                ExeMode <= ExecuteModes_DMA_In; // @[Enum.scala 148:67]
              end else begin
                if(when_Spinal1802_l629) begin
                  RegSelMode <= RegSelectModes_DMA0; // @[Enum.scala 148:67]
                  ExeMode <= ExecuteModes_DMA_Out; // @[Enum.scala 148:67]
                end else begin
                  if(when_Spinal1802_l633) begin
                    ExeMode <= ExecuteModes_None; // @[Enum.scala 148:67]
                  end else begin
                    if(when_Spinal1802_l636) begin
                      ExeMode <= ExecuteModes_None; // @[Enum.scala 148:67]
                    end
                  end
                end
              end
            end
          end
        end
        CoreFMS_enumDef_S2_DMA : begin
          SC <= 2'b10; // @[Spinal1802.scala 649:20]
          if(when_Spinal1802_l651) begin
            BusControl <= BusControlModes_DataIn; // @[Enum.scala 148:67]
            RegSelMode <= RegSelectModes_DMA0; // @[Enum.scala 148:67]
          end
          if(when_Spinal1802_l656) begin
            RegOpMode <= RegOperationModes_Inc; // @[Enum.scala 148:67]
          end
          if(when_Spinal1802_l660) begin
            RegOpMode <= RegOperationModes_None; // @[Enum.scala 148:67]
          end
          if(!when_Spinal1802_l663) begin
            if(StateCounter_willOverflow) begin
              if(when_Spinal1802_l666) begin
                ExeMode <= ExecuteModes_None; // @[Enum.scala 148:67]
                if(!when_Spinal1802_l668) begin
                  RegSelMode <= RegSelectModes_PSel; // @[Enum.scala 148:67]
                end
              end
            end
          end
        end
        CoreFMS_enumDef_S3_INT : begin
          SC <= 2'b11; // @[Spinal1802.scala 682:20]
          if(when_Spinal1802_l688) begin
            P <= 4'b0001; // @[Spinal1802.scala 689:23]
            X <= 4'b0010; // @[Spinal1802.scala 690:23]
          end
          if(!when_Spinal1802_l693) begin
            if(StateCounter_willOverflow) begin
              if(when_Spinal1802_l697) begin
                ExeMode <= ExecuteModes_DMA_In; // @[Enum.scala 148:67]
              end else begin
                if(when_Spinal1802_l700) begin
                  ExeMode <= ExecuteModes_DMA_Out; // @[Enum.scala 148:67]
                end else begin
                  RegSelMode <= RegSelectModes_PSel; // @[Enum.scala 148:67]
                end
              end
            end
          end
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l253) begin
        _zz_when_State_l238 <= 4'b1001; // @[State.scala 233:17]
      end
    end
  end


endmodule
