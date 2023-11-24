class scoreboard;
  parameter N=8;
  mailbox mon2scb;
  int no_transactions;
  
  function new (mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  task main;
    bit [N-1:0] a_in;
    bit [N-1:0] b_in;
    bit start;
    bit  [(N*2)-1:0] out;
    bit finish;
    
    multiplier_trans  trans;
	forever begin
      mon2scb.get(trans);
      a_in=trans.a_in;
      b_in=trans.b_in;
      start=trans.start;
      out=trans.out;
      finish=trans.finish;
      case(start)
        1'b1:begin
          out=a_in*b_in;
          finish=1'b0;
        end
        1'b0: begin
          out=1'b0;
          finish=1'b0;
        end
      endcase
      
      if((out==trans.out) && (finish==trans.finish))begin
          $display("Transaction %0d : Result is as expected ",no_transactions);
        end 
      else begin
          $display("Transaction %0d : Result is as expected ",no_transactions);
      end
      $display("[Scoreboard] : Transactions %0d details ",no_transactions);
      $display("a_in: %d",a_in);
      $display("b_in: %d",b_in);
      $display("start: %d",start);
      $display("Expected out: %d",out);
      $display("REceived out: %d",trans.out);
      $display("Expected finish: %d",finish);
      $display("REceived finish: %d",trans.finish);
      no_transactions++;
    end
  endtask
endclass



            
        
        
       
