
class multiplier_cov;
multiplier_trans trans;
covergroup cov_inst;
option.per_instance = 1;

a_in: coverpoint trans.a_in {bins a_in = { [0:30000]}; }  
b_in: coverpoint trans.b_in {bins b_in = { [0:30000]}; }
start: coverpoint trans.start {bins start = { [0:1]}; }  
finish: coverpoint trans.finish {bins finish = { [0:1]}; } 
bcd: coverpoint trans.bcd {bins bcd = { [0:30000]}; } 
out: coverpoint trans.out {bins out = { [0:30000]}; } 
endgroup
function new();
cov_inst = new;
endfunction
task main;
cov_inst. sample();
endtask
endclass
