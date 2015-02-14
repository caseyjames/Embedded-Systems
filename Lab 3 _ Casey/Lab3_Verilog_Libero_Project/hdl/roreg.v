// roreg.v
module roreg( clk, nreset, rd_en, from_dec, data_out); 
 
//Inputs Declarations 
input clk; //Clock
input nreset; //active low reset 
input rd_en; //Read Enable 
input [3:0] from_dec; //path from switches
 
//output Declarations 
output [7:0] data_out;
 
//reg Declarations 
reg [7:0] data_out;
wire [3:0] from_dec;

//read led register
always @(posedge clk, negedge nreset) 
begin : READ_GEN 
 if(nreset == 1'b0)
 begin
 data_out <= 8'hff;  // set bits to 1, shutting of LED's
 end
 else if(rd_en)
 begin 
 data_out[0] <= from_dec[0];
 data_out[1] <= from_dec[1];
 data_out[2] <= from_dec[2];
 data_out[3] <= from_dec[3];
 end 
end
endmodule