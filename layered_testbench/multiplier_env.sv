
class multiplier_env;
multiplier_gen gen;
multiplier_bfm bfm;
multiplier_cov cov;
scoreboard scb;
monitor mon;

mailbox gen2bfm;
mailbox mon2scb;
virtual multiplier_intf intf;
event ended;
function new(virtual multiplier_intf intf);
this.intf = intf;
gen2bfm = new();
mon2scb=new();
gen = new(gen2bfm, ended);
bfm = new(intf, gen2bfm);
scb=new(mon2scb);
mon = new(intf,mon2scb);
cov = new();
endfunction
task pre_test;
bfm.reset();
endtask



task test;
fork
gen.main();
bfm.main();
cov.main();
scb.main();
mon.main();

join_any
endtask
task post_test;
wait(ended.triggered);
wait(gen.repeat_count == bfm.no_transactions);
wait(gen.repeat_count == scb.no_transactions);
endtask
task run;
pre_test();
test();
post_test();
$finish;
endtask
endclass
