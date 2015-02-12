///////////////////////////////////////////////////////////////////////////////////////////////////
//
//	WRITE ONLY REG
//
////////////////////////////////////////////////////////////////////////////////////////////////////

module write_only_reg(
input clk, 
input nreset, 
input wr_en,
input data_in, 
output data_out, 
output led_port);

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
	begin  
		data_out[0] <= sw_port[0];  
	    data_out[1] <= sw_port[1];  
	end 
end 
endmodule

