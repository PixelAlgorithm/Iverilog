`timescale 1ns/1ps

module TB_D;
  reg D;
  reg CLK;
  reg RST;
  wire Q;
  d_ff newD (.D(D), .clk(CLK), .rst(RST), .Q(Q));
  initial begin
    CLK = 1'b0;
    forever #5 CLK = ~CLK;
  end
  initial begin
    $dumpfile("d_ff.vcd");
    $dumpvars(0, TB_D);
  end
  initial begin
    RST = 1'b1;
    D   = 1'b0; #9;
    RST = 1'b0; #6;
    D   = 1'b1; #7;
    D   = 1'b0; #9;
    D   = 1'b1; #11;
    D   = 1'b0; #6;
    RST = 1'b1; #5;
    RST = 1'b0; #15;
    $finish;
  end

initial begin
    $monitor("At time %t, D = %b, RST = %b, Q = %b",$time,D,RST,Q);
  end
endmodule
