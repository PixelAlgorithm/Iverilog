module d_ff (input wire D, input wire clk, input wire rst, output reg Q);
  always @(negedge clk) 
begin  
  if (rst)      Q <= 1'b0;     // Asynchronous reset to 0   
 else      Q <= D;        // Sample D on falling edge of clock
  end
endmodule
