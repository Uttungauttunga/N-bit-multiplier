
class monitor;
  virtual multiplier_intf intf;
  mailbox mon2scb;
  function new(virtual multiplier_intf intf,mailbox mon2scb);
    this.intf = intf;
    this.mon2scb = mon2scb;
  endfunction
  task main;
    forever begin
      multiplier_trans trans;
      trans = new();

      @(posedge intf.clk);
      wait(intf.start);
        trans.a_in  = intf.a_in;
        trans.b_in  = intf.b_in;
        trans.start=intf.start;
      repeat(10)@(posedge intf.clk);
         trans.out=intf.out;
         trans.finish=intf.finish;
         mon2scb.put(trans);
      
    end
  endtask
endclass

