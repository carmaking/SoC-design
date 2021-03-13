//use half_adder
module full_adder(
input   wire    x,
input   wire    y,
input   wire    cin,

output  wire    s,
output  wire    cout
);

wire    Ha1_cout;
wire    Ha1_s;
wire    Ha2_cout;

half_adder  HA1(    .x(x), .y(y), .s(Ha1_s), .cout(Ha1_cout));
half_adder  HA2(    .x(cin), .y(Ha1_s), .s(s), .cout(Ha2_cout));

assign cout = Ha1_cout | Ha2_cout;

endmodule
