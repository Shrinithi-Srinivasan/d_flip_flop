module d_flip_flop_tb_top;
  logic clk;
  logic rst;
  logic d;
  logic q;
  d_flip_flop d_flip_flop_inst (.d(d),.clk(clk),.rst(rst),.q(q));
  initial begin
    clk = 1'b0;rst = 1'b1;d = 1'b0;
  end
  always begin
    #5 clk = ~clk;
  end
  initial begin
    #10 d = 1'b0; rst = 1'b0;
    #10 d = 1'b1;
    #10 d = 1'b0;
    #10 d = 1'b1;
    $display("Values of display clk = %0b, rst = %0b, d = %0b, q = %0b", clk, rst, d, q);
    $monitor("Values of Monitor clk = %0b, rst = %0b, d = %0b, q = %0b", clk, rst, d, q);
    $display("End of Simulation at %0t", $time);
    #50 $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
