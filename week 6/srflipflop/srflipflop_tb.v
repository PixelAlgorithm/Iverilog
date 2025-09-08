module TB_SR;
reg S;
reg R;
reg CLK;
reg RST;
wire Q;
sr_ff newSR (.S(S), .R(R), .clk(CLK), .rst(RST), .Q(Q));
initial begin
  CLK=1'b0;
  forever #5 CLK=~CLK;
end
initial begin
  $dumpfile("sr_ff.vcd");
  $dumpvars(0, TB_SR);
end
initial begin
  $monitor("Time=%0t | RST=%b | S=%b R=%b | Q=%b", $time, RST, S, R, Q);
end
initial begin
  RST=1'b1; S=1'b0; R=1'b0; #8;
  RST=1'b0; #6;
  S=1'b0; R=1'b0; #15;  // hold
  S=1'b1; R=1'b0; #10;  // set
  S=1'b0; R=1'b0; #10;  // hold
  S=1'b0; R=1'b1; #10;  // reset
  S=1'b0; R=1'b0; #10;  // hold
  S=1'b1; R=1'b0; #10;  // set
  S=1'b1; R=1'b1; #10;  // invalid
  S=1'b0; R=1'b0; #15;  // hold
  $finish;
end
endmodule
