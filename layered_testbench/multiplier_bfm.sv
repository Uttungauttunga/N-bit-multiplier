class multiplier_bfm;
virtual multiplier_intf intf;
mailbox gen2bfm;
int no_transactions;
function new(virtual multiplier_intf intf,mailbox gen2bfm);
this.intf = intf;
this.gen2bfm = gen2bfm;
endfunction
task reset;

wait(!intf.reset);
$display("Reset Initiated");
intf.bfm_cb.start <= 0;
intf.bfm_cb.a_in <= 0;
intf.bfm_cb.b_in <= 0;

wait(intf.reset);
$display("Reset finished");
endtask



task main;
forever begin
multiplier_trans trans;
gen2bfm.get(trans);
$display("Transaction No. = %0d", no_transactions);
@(posedge intf.clk);
trans.start=0;
intf.bfm_cb.start <= trans.start;
intf.bfm_cb.a_in <= trans.a_in;
intf.bfm_cb.b_in <= trans.b_in;
@(posedge intf.clk);
trans.start=1;
intf.start = trans.start;
repeat(10)@(posedge intf.clk);
trans.bcd = intf.bfm_cb.bcd;
trans.out= intf.bfm_cb.out;
trans.start=0;
trans.finish= intf.bfm_cb.finish;
trans.display();

no_transactions++;
end
endtask




endclass
