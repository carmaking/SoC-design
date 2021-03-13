module  half_adder(
input       wire    x,
input       wire    y,

output      wire    s,
output      wire    cout
);

assign s = x ^ y;
assign cout = x & y;

endmodule
