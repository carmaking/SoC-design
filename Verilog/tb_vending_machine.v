`timescale  1ns /   1ps

module tb_vending_machine();

//vending machine 입력
reg         rst_n;
reg         clk;
reg         coin, selection, refund;
//vending machine 출력
wire        beverage;

vending_machine VM_u0(  .rst_n(rst_n),
                        .clk(clk),  .coin(coin),
                        .selection(selection),
                        .refund(refund),
                        
                        .beverage(beverage));
                        
parameter   PERIOD_100MHZ   =   10;
always begin
    #(PERIOD_100MHZ/2);
    clk <=  ~clk;
end

initial begin
    rst_n       =   1'b1;
    clk         =   1'b0;
    coin        =   1'b0;
    selection   =   1'b0;
    refund      =   1'b0;
    
    #40 rst_n       =   1'b0;
    #20 rst_n       =   1'b1;
    #40 coin        =   1'b1;
    #20 coin        =   1'b0;
    #40 refund      =   1'b1;
    #20 refund      =   1'b0;
    #40 coin        =   1'b1;
    #20 coin        =   1'b0;
    #40 selection   =   1'b1;
    #20 selection   =   1'b0;
    #200    $stop;
end

endmodule
