//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Feb 26 15:11:02 2015
// Version: 10.1 10.1.0.14
//////////////////////////////////////////////////////////////////////

`timescale 1 ns/100 ps

// lab4
module lab4(
    // Inputs
    MSS_RESET_N,
    SW,
    UART_0_RXD,
    // Outputs
    LED,
    UART_0_TXD
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        MSS_RESET_N;
input  [1:0] SW;
input        UART_0_RXD;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [7:0] LED;
output       UART_0_TXD;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          CoreAPB3_0_APBmslave0_PENABLE;
wire   [31:0] CoreAPB3_0_APBmslave0_PRDATA;
wire          CoreAPB3_0_APBmslave0_PREADY;
wire          CoreAPB3_0_APBmslave0_PSELx;
wire          CoreAPB3_0_APBmslave0_PSLVERR;
wire   [31:0] CoreAPB3_0_APBmslave0_PWDATA;
wire          CoreAPB3_0_APBmslave0_PWRITE;
wire          lab4_MSS_0_FAB_CLK;
wire          lab4_MSS_0_M2F_RESET_N;
wire          lab4_MSS_0_MSS_MASTER_APB_PENABLE;
wire   [31:0] lab4_MSS_0_MSS_MASTER_APB_PRDATA;
wire          lab4_MSS_0_MSS_MASTER_APB_PREADY;
wire          lab4_MSS_0_MSS_MASTER_APB_PSELx;
wire          lab4_MSS_0_MSS_MASTER_APB_PSLVERR;
wire   [31:0] lab4_MSS_0_MSS_MASTER_APB_PWDATA;
wire          lab4_MSS_0_MSS_MASTER_APB_PWRITE;
wire   [7:0]  LED_net_0;
wire          MSS_RESET_N;
wire          ReadSW_WriteLED_wrp_0_FABINT;
wire   [1:0]  SW;
wire          UART_0_RXD;
wire          UART_0_TXD_0;
wire          UART_0_TXD_0_net_0;
wire   [7:0]  LED_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire          VCC_net;
wire   [31:0] PRDATAS1_const_net_0;
wire   [31:0] PRDATAS2_const_net_0;
wire   [31:0] PRDATAS3_const_net_0;
wire   [31:0] PRDATAS4_const_net_0;
wire   [31:0] PRDATAS5_const_net_0;
wire   [31:0] PRDATAS6_const_net_0;
wire   [31:0] PRDATAS7_const_net_0;
wire   [31:0] PRDATAS8_const_net_0;
wire   [31:0] PRDATAS9_const_net_0;
wire   [31:0] PRDATAS10_const_net_0;
wire   [31:0] PRDATAS11_const_net_0;
wire   [31:0] PRDATAS12_const_net_0;
wire   [31:0] PRDATAS13_const_net_0;
wire   [31:0] PRDATAS14_const_net_0;
wire   [31:0] PRDATAS15_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net               = 1'b0;
assign VCC_net               = 1'b1;
assign PRDATAS1_const_net_0  = 32'h00000000;
assign PRDATAS2_const_net_0  = 32'h00000000;
assign PRDATAS3_const_net_0  = 32'h00000000;
assign PRDATAS4_const_net_0  = 32'h00000000;
assign PRDATAS5_const_net_0  = 32'h00000000;
assign PRDATAS6_const_net_0  = 32'h00000000;
assign PRDATAS7_const_net_0  = 32'h00000000;
assign PRDATAS8_const_net_0  = 32'h00000000;
assign PRDATAS9_const_net_0  = 32'h00000000;
assign PRDATAS10_const_net_0 = 32'h00000000;
assign PRDATAS11_const_net_0 = 32'h00000000;
assign PRDATAS12_const_net_0 = 32'h00000000;
assign PRDATAS13_const_net_0 = 32'h00000000;
assign PRDATAS14_const_net_0 = 32'h00000000;
assign PRDATAS15_const_net_0 = 32'h00000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign UART_0_TXD_0_net_0 = UART_0_TXD_0;
assign UART_0_TXD         = UART_0_TXD_0_net_0;
assign LED_net_1          = LED_net_0;
assign LED[7:0]           = LED_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [23:0] CoreAPB3_0_APBmslave0_PADDR;
wire   [8:0]  CoreAPB3_0_APBmslave0_PADDR_0_8to0;
wire   [8:0]  CoreAPB3_0_APBmslave0_PADDR_0;
assign CoreAPB3_0_APBmslave0_PADDR_0_8to0 = CoreAPB3_0_APBmslave0_PADDR[8:0];
assign CoreAPB3_0_APBmslave0_PADDR_0 = { CoreAPB3_0_APBmslave0_PADDR_0_8to0 };

wire   [23:20]lab4_MSS_0_MSS_MASTER_APB_PADDR_0_23to20;
wire   [19:0] lab4_MSS_0_MSS_MASTER_APB_PADDR_0_19to0;
wire   [23:0] lab4_MSS_0_MSS_MASTER_APB_PADDR_0;
wire   [19:0] lab4_MSS_0_MSS_MASTER_APB_PADDR;
assign lab4_MSS_0_MSS_MASTER_APB_PADDR_0_23to20 = 4'h0;
assign lab4_MSS_0_MSS_MASTER_APB_PADDR_0_19to0 = lab4_MSS_0_MSS_MASTER_APB_PADDR[19:0];
assign lab4_MSS_0_MSS_MASTER_APB_PADDR_0 = { lab4_MSS_0_MSS_MASTER_APB_PADDR_0_23to20, lab4_MSS_0_MSS_MASTER_APB_PADDR_0_19to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CoreAPB3   -   Actel:DirectCore:CoreAPB3:3.0.103
CoreAPB3 #( 
        .APB_DWIDTH      ( 32 ),
        .APBSLOT0ENABLE  ( 1 ),
        .APBSLOT1ENABLE  ( 0 ),
        .APBSLOT2ENABLE  ( 0 ),
        .APBSLOT3ENABLE  ( 0 ),
        .APBSLOT4ENABLE  ( 0 ),
        .APBSLOT5ENABLE  ( 0 ),
        .APBSLOT6ENABLE  ( 0 ),
        .APBSLOT7ENABLE  ( 0 ),
        .APBSLOT8ENABLE  ( 0 ),
        .APBSLOT9ENABLE  ( 0 ),
        .APBSLOT10ENABLE ( 0 ),
        .APBSLOT11ENABLE ( 0 ),
        .APBSLOT12ENABLE ( 0 ),
        .APBSLOT13ENABLE ( 0 ),
        .APBSLOT14ENABLE ( 0 ),
        .APBSLOT15ENABLE ( 0 ),
        .IADDR_ENABLE    ( 0 ),
        .RANGESIZE       ( 256 ) )
CoreAPB3_0(
        // Inputs
        .PRESETN    ( GND_net ), // tied to 1'b0 from definition
        .PCLK       ( GND_net ), // tied to 1'b0 from definition
        .PWRITE     ( lab4_MSS_0_MSS_MASTER_APB_PWRITE ),
        .PENABLE    ( lab4_MSS_0_MSS_MASTER_APB_PENABLE ),
        .PSEL       ( lab4_MSS_0_MSS_MASTER_APB_PSELx ),
        .PREADYS0   ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERRS0  ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .PREADYS1   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS1  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS2   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS2  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS3   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS3  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS4   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS4  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS5   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS5  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS6   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS6  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS7   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS7  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS8   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS8  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS9   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS9  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS10  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS10 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS11  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS11 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS12  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS12 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS13  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS13 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS14  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS14 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS15  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS15 ( GND_net ), // tied to 1'b0 from definition
        .PADDR      ( lab4_MSS_0_MSS_MASTER_APB_PADDR_0 ),
        .PWDATA     ( lab4_MSS_0_MSS_MASTER_APB_PWDATA ),
        .PRDATAS0   ( CoreAPB3_0_APBmslave0_PRDATA ),
        .PRDATAS1   ( PRDATAS1_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS2   ( PRDATAS2_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS3   ( PRDATAS3_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS4   ( PRDATAS4_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS5   ( PRDATAS5_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS6   ( PRDATAS6_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS7   ( PRDATAS7_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS8   ( PRDATAS8_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS9   ( PRDATAS9_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS10  ( PRDATAS10_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS11  ( PRDATAS11_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS12  ( PRDATAS12_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS13  ( PRDATAS13_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS14  ( PRDATAS14_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS15  ( PRDATAS15_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .PREADY     ( lab4_MSS_0_MSS_MASTER_APB_PREADY ),
        .PSLVERR    ( lab4_MSS_0_MSS_MASTER_APB_PSLVERR ),
        .PWRITES    ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PENABLES   ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PSELS0     ( CoreAPB3_0_APBmslave0_PSELx ),
        .PSELS1     (  ),
        .PSELS2     (  ),
        .PSELS3     (  ),
        .PSELS4     (  ),
        .PSELS5     (  ),
        .PSELS6     (  ),
        .PSELS7     (  ),
        .PSELS8     (  ),
        .PSELS9     (  ),
        .PSELS10    (  ),
        .PSELS11    (  ),
        .PSELS12    (  ),
        .PSELS13    (  ),
        .PSELS14    (  ),
        .PSELS15    (  ),
        .PRDATA     ( lab4_MSS_0_MSS_MASTER_APB_PRDATA ),
        .PADDRS     (  ),
        .PADDRS0    ( CoreAPB3_0_APBmslave0_PADDR ),
        .PWDATAS    ( CoreAPB3_0_APBmslave0_PWDATA ) 
        );

//--------lab4_MSS
lab4_MSS lab4_MSS_0(
        // Inputs
        .MSS_RESET_N ( MSS_RESET_N ),
        .MSSPREADY   ( lab4_MSS_0_MSS_MASTER_APB_PREADY ),
        .MSSPSLVERR  ( lab4_MSS_0_MSS_MASTER_APB_PSLVERR ),
        .UART_0_RXD  ( UART_0_RXD ),
        .FABINT      ( ReadSW_WriteLED_wrp_0_FABINT ),
        .MSSPRDATA   ( lab4_MSS_0_MSS_MASTER_APB_PRDATA ),
        // Outputs
        .MSSPSEL     ( lab4_MSS_0_MSS_MASTER_APB_PSELx ),
        .MSSPENABLE  ( lab4_MSS_0_MSS_MASTER_APB_PENABLE ),
        .MSSPWRITE   ( lab4_MSS_0_MSS_MASTER_APB_PWRITE ),
        .M2F_RESET_N ( lab4_MSS_0_M2F_RESET_N ),
        .FAB_CLK     ( lab4_MSS_0_FAB_CLK ),
        .UART_0_TXD  ( UART_0_TXD_0 ),
        .MSSPADDR    ( lab4_MSS_0_MSS_MASTER_APB_PADDR ),
        .MSSPWDATA   ( lab4_MSS_0_MSS_MASTER_APB_PWDATA ) 
        );

//--------ReadSW_WriteLED_wrp
ReadSW_WriteLED_wrp ReadSW_WriteLED_wrp_0(
        // Inputs
        .PCLK    ( lab4_MSS_0_FAB_CLK ),
        .PENABLE ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PSEL    ( CoreAPB3_0_APBmslave0_PSELx ),
        .PRESERN ( lab4_MSS_0_M2F_RESET_N ),
        .PWRITE  ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PADDR   ( CoreAPB3_0_APBmslave0_PADDR_0 ),
        .PWDATA  ( CoreAPB3_0_APBmslave0_PWDATA ),
        .SW      ( SW ),
        // Outputs
        .PREADY  ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERR ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .FABINT  ( ReadSW_WriteLED_wrp_0_FABINT ),
        .PRDATA  ( CoreAPB3_0_APBmslave0_PRDATA ),
        .LED     ( LED_net_0 ) 
        );


endmodule
