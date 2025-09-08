module TB_D_using_T;
reg D;
reg CLK;
reg RST;
wire Q;
d_using_t_ff newD (.D(D), .clk(CLK), .rst(RST), .Q(Q));
initial begin
  CLK=1'b0;
  forever #5 CLK=~CLK;
end
initial begin
  $dumpfile("d_using_t.vcd");
  $dumpvars(0, TB_D_using_T);
end
initial begin
  $monitor("Time=%0t | RST=%b | D=%b | Q=%b", $time, RST, D, Q);
end
initial begin
  RST=1'b1; D=1'b0; #8;
  RST=1'b0; #6;
  D=1'b0; #15;  // Q should follow D
  D=1'b1; #10;  // Q should become 1
  D=1'b0; #10;  // Q should become 0
  D=1'b1; #10;  // Q should become 1
  D=1'b1; #10;  // Q should stay 1
  D=1'b0; #10;  // Q should become 0
  RST=1'b1; #5;
  RST=1'b0; #15;
  $finish;
end
endmodule
