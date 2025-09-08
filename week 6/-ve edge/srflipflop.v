module sr_ff (input wire S, input wire R, input wire clk, input wire rst, output reg Q);
always @(negedge clk)
begin
  if (rst)
    Q <= 1'b0;
  else begin
    case ({S,R})
      2'b00: Q <= Q;        // hold
      2'b01: Q <= 1'b0;     // reset
      2'b10: Q <= 1'b1;     // set
      2'b11: Q <= 1'bx;     // invalid
    endcase
  end
end
endmodule
