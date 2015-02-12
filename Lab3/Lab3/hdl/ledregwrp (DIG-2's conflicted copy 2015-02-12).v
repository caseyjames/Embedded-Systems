///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: ledregwrp.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::SmartFusion> <Die::A2F200M3F> <Package::484 FBGA>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 
// ledregwrp.v 
module ledregwrp(  PCLK,  PENABLE,  PSEL,  PRESERN,  PWRITE,  PREADY,  PSLVERR,  PWDATA,  PRDATA,  LEDCON,  TPS);
input PCLK,PENABLE, PSEL, PRESERN, PWRITE; 
input [7:0] PWDATA; 
output [7:0] PRDATA, LEDCON; 
output PREADY, PSLVERR; 
output [4:0] TPS;//test points
wire rd_enable; 
wire wr_enable;
assign wr_enable = (PENABLE && PWRITE && PSEL); 
assign rd_enable = (!PWRITE && PSEL); //Data is ready during first cycle to make it availble on the bus when PENABLE is asserted
ledreg ledreg_0 (.clk(PCLK), .nreset(PRESERN), .wr_en(wr_enable),  .rd_en(rd_enable), .data_in(PWDATA), .data_out(PRDATA),  .led_port(LEDCON)); 
assign PREADY = 1'b1; 
assign PSLVERR = 1'b0;
assign TPS[0] = PCLK;

assign TPS[1] = PWRITE; 
assign TPS[2] = PSEL; 
assign TPS[3] = PENABLE; 
assign TPS[4] = PREADY; 
endmodule

