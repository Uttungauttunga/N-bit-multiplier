class multiplier_trans;

parameter N = 8;

randc bit [N-1:0] a_in;
randc bit [N-1:0] b_in;
 bit start;


bit[(((N*2)/3)+1)*4-1:0] bcd; 
bit[(N*2)-1:0] out;
bit finish;

function void display();
$display(" ");
$display("\t a_in = %0b, \t b_in = %0b, \t start = %0b, \t bcd = %0b, \t out = %0b, \t finish = %0b",a_in,b_in,start,bcd,out,finish);
$display(" ");

endfunction
endclass
