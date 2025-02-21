module servo_pdm
# (
	parameter  clk_hz	= 25000000
) ( 
        input  wire       rst,	// Global RESET signal
        input  wire       clk,	// Global Clock
	input  wire       en,	// Enable signal
	input  reg [7:0]  duty,	// input Duty cycle value
        output reg        pdm	// produced PDM signal
);
        reg     [19:0] count_low;
        reg     [15:0] count_high;
	reg	       state;	// 0 - counting low, 1 - counting high

        wire     [15:0] count_high_top;
        wire     [19:0] count_low_top;
	// 1.0ms - 25000
	// 1.5ms - 37500
	// 2.0ms - 50000
	// 20ms  - 500000
	
	assign count_low_top = 20'd500000;
	assign count_high_top = 20'd25000 + (20'd97 * 20'(duty));
	
        always @(posedge clk or posedge rst)
        begin
		if (rst) begin
                        count_low <= '0;
                        count_high <= '0;
                        state <= '0;
		end
	       	else if(en) begin
			case(state)

				1'b0: begin
                        		count_low <= count_low + 'b1;
					if(count_low == count_low_top) begin
						pdm <= 'b1;
						count_low <= 0;
						state <= 'b1;
					end
				end

				1'b1: begin
                        		count_high <= count_high + 'b1;
					if(count_high == count_high_top) begin
						pdm <= 'b0;
						count_high <= 0;
						state <= 'b0;
					end
				end
			endcase
		end
        end

endmodule
