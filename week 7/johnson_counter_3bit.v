module d_ff (input wire D, input wire clk, input wire rst, output reg Q);
always @(posedge clk) 
begin  
  if (rst)      Q<=1'b0;     // Asynchronous reset to 0   
 else      Q<=D;        // Sample D on rising edge of clock
end
endmodule

// 3-bit Johnson Counter using D Flip-flop  
module johnson_counter_3bit(input clk, input reset, output [2:0] q);

// Johnson counter: 000->001->011->111->110->100->000...
// Each D input gets the previous Q, except first gets inverted last Q
d_ff dff0(.D(~q[2]), .clk(clk), .rst(reset), .Q(q[0]));
d_ff dff1(.D(q[0]), .clk(clk), .rst(reset), .Q(q[1]));
d_ff dff2(.D(q[1]), .clk(clk), .rst(reset), .Q(q[2]));

endmodule