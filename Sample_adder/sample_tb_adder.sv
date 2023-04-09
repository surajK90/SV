// Code your testbench here
module add_tb;
  reg a,b,cin;
  wire sum;
 
// instantiate the DUT block  
  full_add f1(.a(a),.b(b),.cin(cin),.sum(sum));
 
// this particular line is added to dump the file on online simulator
  initial begin $dumpfile("full_tb.vcd");$dumpvars(); end

// insert all the inputs 
  initial begin a=1'b1;  #4; a=1'b0;#10 $stop();end
  initial begin b=1'b1; forever #2 b=~b;end
  initial begin cin=1'b1;forever #1 cin=~cin; #10 $stop();end

// monitor all the input and output ports at times 
// when any of the input changes its state

 initial begin $monitor("A=%b, B=%b, Cin=%b, Sum=%b",a,b,cin,sum);end
 endmodule