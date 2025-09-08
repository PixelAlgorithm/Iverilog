module TB_T; 
 reg T;  
reg CLK;
  reg RST;  
wire Q; 
 // Instantiate T flip-flop 
 t_ff newT (.T(T), .clk(CLK), .rst(RST), .Q(Q));
  // Clock generation: 10 time units period
  initial begin
    CLK = 1'b0;
    forever #5 CLK = ~CLK;
  end
// Waveform dump 
 initial 
begin   
 $dumpfile("t_ff.vcd");   
 $dumpvars(0, TB_T);  
end 
 // Monitor prints automatically whenever any signal changes  
initial 
begin   
 $monitor("Time=%0t | RST=%b | T=%b | Q=%b", $time, RST, T, Q);
  end
 // Stimulus
  initial
 begin
   RST = 1'b1;
 T = 1'b0; #7;
    RST = 1'b0; #8; 
   T = 1'b0; #20;  // hold
    T = 1'b1; #40;  // toggle
    T = 1'b0; #20;  // hold  
  RST = 1'b1; #6;  
  RST = 1'b0; #14;    
$finish;
end

endmodule
