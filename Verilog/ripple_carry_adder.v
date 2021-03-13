module ripple_carry_adder(

input       wire    [3:0]   x,
input       wire    [3:0]   y,
input       wire            sub,

output      wire    [3:0]   sum,
output      wire            cout
);

wire        y_0, y_1, y_2, y_3;
wire        c1, c2, c3;

mux     MUX0(   .a(y[0]), .b(!y[0]), .sel(sub), .out(y_0));
mux     MUX1(   .a(y[1]), .b(!y[1]), .sel(sub), .out(y_1));
mux     MUX2(   .a(y[2]), .b(!y[2]), .sel(sub), .out(y_2));
mux     MUX3(   .a(y[3]), .b(!y[3]), .sel(sub), .out(y_3));

full_adder      FA0(    .x(x[0]),   .y(y_0),    .cin(sub),  .s(sum[0]), .cout(c1)  );
full_adder      FA1(    .x(x[1]),   .y(y_1),    .cin(c1),  .s(sum[1]), .cout(c2)  );
full_adder      FA2(    .x(x[2]),   .y(y_2),    .cin(c2),  .s(sum[2]), .cout(c3)  );
full_adder      FA3(    .x(x[3]),   .y(y_3),    .cin(c3),  .s(sum[3]), .cout(cout)  );

endmodule
