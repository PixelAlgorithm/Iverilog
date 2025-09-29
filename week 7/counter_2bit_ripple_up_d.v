module d_ff (input wire D, input wire clk, input wire rst, output reg Q);
always @(posedge clk) 
begin  
  if (rst)      Q<=1'b0;     // Asynchronous reset to 0   
 else      Q<=D;        // Sample D on rising edge of clock
end
endmodule

// 2-bit Ripple Up Counter using D Flip-flop
module ripple_counter_2bit(input clk, input reset, output [1:0] q);

// First flip-flop - toggles with main clock
d_ff dff0(.D(~q[0]), .clk(clk), .rst(reset), .Q(q[0]));

// Second flip-flop - toggles with output of first flip-flop (ripple effect)
d_ff dff1(.D(~q[1]), .clk(~q[0]), .rst(reset), .Q(q[1]));

endmodule