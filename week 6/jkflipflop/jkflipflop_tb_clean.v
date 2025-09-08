`timescale 1ns/1ps
module tb_jk_ff;
  reg j, k, clk, rst;
  wire q;

  // Instantiate JK flip-flop
  jk_ff jk1 (
    .j(j),
    .k(k),
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Generate clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test sequence
  initial begin
    $monitor("Time=%0t | RST=%b | J=%b K=%b | Q=%b", $time, rst, j, k, q);
    rst = 1; j = 0; k = 0;
    #10 rst = 0;
    #10 j = 0; k = 0; // Hold
    #10 j = 0; k = 1; // Reset
    #10 j = 1; k = 0; // Set
    #10 j = 1; k = 1; // Toggle
    #10 j = 1; k = 1; // Toggle again
    #10 j = 0; k = 1; // Reset
    #10 j = 1; k = 0; // Set
    #20 $finish;
  end

endmodule
