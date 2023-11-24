interface multiplier_intf(input logic clk,reset);
logic start;
logic finish;
parameter N = 8;

logic [(((N*2)/3)+1)*4-1:0] bcd; 
logic [(N*2)-1:0] out;
logic  [N-1:0] a_in;
logic [N-1:0] b_in;


clocking bfm_cb @(posedge clk);
default input #1 output #1;
output start;
output a_in;
output b_in;
input bcd;
input out;
input finish;
endclocking

clocking monitor_cb @(posedge clk);
default input #1 output #1;
input start;
input a_in;
input b_in;
input bcd;
input out;
input finish;
endclocking
modport BFM (clocking bfm_cb, input clk,reset);
modport MONITOR (clocking monitor_cb, input clk, reset);
endinterface
