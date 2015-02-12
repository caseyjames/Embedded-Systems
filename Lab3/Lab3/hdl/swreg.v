///////////////////////////////////////////////////////////////////////////////////////////////////
//
// File: swreg.v
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 
// swreg.v
 module swreg( clk, nreset, rd_en, sw_port, data_out); 
//Inputs Declarations 
input clk; 
//Clock 
input nreset; 
//active low reset

input rd_en; 
//Read Enable 
input [1:0] sw_port; 
//path from switches 
//output Declarations 
output [7:0] data_out; 
//reg Declarations 
reg [7:0] data_out;
wire [1:0] sw_port;
//read led register 
always @(posedge clk, negedge nreset) 
begin : READ_GEN  
if(nreset == 1'b0)  
begin  data_out <= 8'h00;  
end  
else if(rd_en)  
begin  data_out[0] <= sw_port[0];  
data_out[1] <= sw_port[1];  
end 
end 
endmodule
