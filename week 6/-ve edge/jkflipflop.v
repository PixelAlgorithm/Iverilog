module jk_ff (input wire j, input wire k, input wire clk, input wire rst, output reg q);
always @(negedge clk or posedge rst) 
begin       
 if (rst)            
     q <= 1'b0;                // Reset to 0       
 else begin 
     case ({j, k})             
       2'b00: q <= q;        // No change       
       2'b01: q <= 1'b0;     // Reset       
       2'b10: q <= 1'b1;     // Set            
       2'b11: q <= ~q;       // Toggle          
     endcase       
 end 
end
endmodule
