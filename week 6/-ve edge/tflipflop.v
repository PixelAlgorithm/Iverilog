module t_ff (input wire T, input wire clk, input wire rst, output reg Q);

always @(negedge clk )
	 begin  if (rst) 
                   Q <= 1'b0;  
                 else if (T)    Q <= ~Q;   // toggle  
	else    Q <= Q;    // hold
end
endmodule
