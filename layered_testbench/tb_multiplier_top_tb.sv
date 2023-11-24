
module tb_multiplier_top_tb;
bit clk;
bit reset;
multiplier_intf intf(clk,reset);
multiplier_test test(intf);
multiplier dut(.clk(intf.clk),.reset(intf.reset),.bcd(intf.bcd),
.out(intf.out),
.finish(intf.finish),
.start(intf.start),
.a_in(intf.a_in),
.b_in(intf.b_in)
);
always #5 clk = ~clk;
initial begin
  reset = 1;
#10; reset = 0;
end

endmodule
