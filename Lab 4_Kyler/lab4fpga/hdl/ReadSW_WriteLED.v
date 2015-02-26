// ReadSW_WriteLED.v

module ReadSW_WriteLED(clk, 
                        nreset,
                        bus_write_en, 
                        bus_read_en,
                        bus_addr,
                        bus_write_data, //data_in
                        sw_port,
                        bus_read_data, //data_out
                        led_port, 
						fabint);
	
    input clk, nreset, bus_write_en, bus_read_en;
    input [7:0] bus_addr;
    input [1:0] sw_port; 
    input [31:0] bus_write_data;
    output [7:0] led_port;
    output reg [31:0] bus_read_data;
    output reg fabint;

    reg  [2:0]   led_reg;
    reg  [1:0]   sw_reg;
    reg  [2:0]  sw0_pulse;
	reg  [2:0]  sw1_pulse;
	wire  [1:0] sw0_int, sw1_int;

    Decoder3to8 Decoder3to8_0 (.DataIn3bit(led_reg), .DataOut8bit(led_port));
	

    always@(posedge clk)
		begin
				case(sw_port)
				2'b01: sw_reg <= 2'b01;
				2'b10: sw_reg <= 2'b10;
				2'b11: sw_reg <= 2'b11;
				
				endcase
        if(~nreset) // Reset
            led_reg[2:0] <= 3'd0;
        else
            begin 
            case(bus_addr[3:2])
            2'b00:
                if(bus_write_en)
                    led_reg <= bus_write_data[2:0];
            2'b01:
                if(bus_read_en)
					begin
                    bus_read_data[31:0] <= {30'd0, sw_reg};
				    sw_reg <= 2'b00;
					end
            default:
                if(bus_read_en)
                    bus_read_data[31:0] <= {29'd0, led_reg};
            endcase
            end
		end
    /* Synchonization of Asynchronous switch input */
always@(posedge clk or negedge sw_port[0])
if(~ sw_port[0])
	begin
	sw0_pulse[0] <= 1'b0;
	sw0_pulse[1] <= 1'b0;
	sw0_pulse[2] <= 1'b0;
	end
else
	begin
	sw0_pulse[0] <= 1'b1;
	sw0_pulse[1] <= sw0_pulse[0];
	sw0_pulse[2] <= sw0_pulse[1];
	end
    
always@(posedge clk or negedge  sw_port[1])
if(~ sw_port[1])
	begin
	sw1_pulse[0] <= 1'b0;
	sw1_pulse[1] <= 1'b0;
	sw1_pulse[2] <= 1'b0;
	end
else
	begin
	sw1_pulse[0] <= 1'b1;
	sw1_pulse[1] <= sw1_pulse[0];
	sw1_pulse[2] <= sw1_pulse[1];
	end

/* Pulse detection and pulse generation logic */

assign sw0_int = (sw0_pulse[1] == 1'b1) & (sw0_pulse[2] == 1'b0);
assign sw1_int = (sw1_pulse[1] == 1'b1) & (sw1_pulse[2] == 1'b0);

always@(posedge clk)
if(~nreset)
	begin
	fabint <= 1'b0;
	end
else
	begin
	if(sw0_int)
		begin
		fabint <= 1'b1;
		end
	else if(sw1_int)
		begin
		fabint <= 1'b1;
		end
	else
		begin
		fabint <= 1'b0;
		end
	end

endmodule





// This module decodes the 2^3 or 8 possibilities of 3 input bits into 8 different/unique output bits.
module Decoder3to8( 
					DataIn3bit,
					DataOut8bit);
	
	input [2:0] DataIn3bit;
	output [7:0] DataOut8bit;
	
	reg [7:0] y;

	assign DataOut8bit = ~y; // LEDs are active low
	

	always @*
		begin case (DataIn3bit)
			3'b000: y = 8'b00000001; 
			3'b001: y = 8'b00000010; 
			3'b010: y = 8'b00000100; 
			3'b011: y = 8'b00001000; 
			3'b100: y = 8'b00010000; 
			3'b101: y = 8'b00100000; 
			3'b110: y = 8'b01000000; 
			3'b111: y = 8'b10000000; 
			default y = 0;
		endcase
	end

endmodule
