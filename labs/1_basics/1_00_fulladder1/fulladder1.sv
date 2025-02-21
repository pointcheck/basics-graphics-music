module fulladder1 (
        input  wire       c_in,
        input  wire       a,
        input  wire       b,
        output wire       sum,
        output wire       c_out,
);
        assign c_out = (a & b) | (c_in & (a ^ b));
        assign sum = (c_in ^ (a ^ b));
endmodule
