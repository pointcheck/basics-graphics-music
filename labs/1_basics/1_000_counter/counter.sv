module counter4 (
    input  wire       rst,
    inout  wire       clk,
        output wire [3:0] count,
);
    reg    [3:0] cnt;

    assign    count = cnt;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            cnt <= '0;
        else
            cnt <= cnt + 1'b1;
    end

endmodule
