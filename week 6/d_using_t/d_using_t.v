module d_using_t_ff (input wire D, input wire clk, input wire rst, output wire Q);
wire T_input;
assign T_input = D ^ Q;  // XOR gate logic: T = D XOR Q
t_ff tff1 (.T(T_input), .clk(clk), .rst(rst), .Q(Q));
endmodule
