// ReadSW_WriteLED_wrp.v

module ReadSW_WriteLED_wrp( PCLK,
                          PENABLE,
                          PSEL,
                          PRESERN,
                          PWRITE,
                          PREADY,
                          PSLVERR,
                          PADDR,
                          PWDATA,
                          PRDATA,
                          LED,
                          SW,
                		  FABINT);


    input PCLK,PENABLE, PSEL, PRESERN, PWRITE;
    input  [31:0] PWDATA;
    input  [8:0] PADDR;
    output [31:0] PRDATA;
    output PREADY, PSLVERR, FABINT;

    input  [1:0] SW; 
    output [7:0] LED;

    wire bus_write_enable;
    wire bus_read_enable;
	wire [1:0] switch;

Debouncer sw_0(.clk(PCLK), .nreset(PRESERN), .sw_in(SW[0]), .sw_db(switch[0]));
Debouncer sw_1(.clk(PCLK), .nreset(PRESERN), .sw_in(SW[1]), .sw_db(switch[1]));

    assign bus_write_enable = (PENABLE &&  PWRITE && PSEL);
    assign bus_read_enable = (!PWRITE && PSEL); //Data is ready during first cycle to make it availble on the bus when PENABLE is asserted

    assign PREADY = 1'b1; 
    assign PSLVERR = 1'b0;         

    ReadSW_WriteLED ReadSW_WriteLED_0(.clk(PCLK), 
                                    .nreset(PRESERN),
                                    .bus_write_en(bus_write_enable), 
                                    .bus_read_en(bus_read_enable),
                                    .bus_addr(PADDR),
                                    .bus_write_data(PWDATA), 
                                    .sw_port(switch),
                                    .bus_read_data(PRDATA),
                                    .led_port(LED),
                                    .fabint(FABINT));

  
endmodule