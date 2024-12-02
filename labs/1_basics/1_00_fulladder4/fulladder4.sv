module fulladder4 (
        input  wire       c_in,
        input  wire [3:0] a,
        input  wire [3:0] b,
        output wire [3:0] sum,
        output wire       c_out,
);
        assign {c_out, sum} = a + b + c_in;
endmodule
