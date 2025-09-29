// JK Flip-flop module (copied from existing file)
module jk_ff (input wire j, input wire k, input wire clk, input wire rst, output reg q);
always @(posedge clk or posedge rst) 
begin       
 if (rst)            
     q<=1'b0;                // Reset to 0       
 else begin 
     case ({j, k})             
       2'b00: q<=q;        // No change       
       2'b01: q<=1'b0;     // Reset       
       2'b10: q<=1'b1;     // Set            
       2'b11: q<=~q;       // Toggle          
     endcase       
 end 
end
endmodule

// D Flip-flop module (copied from existing file)
module d_ff (input wire D, input wire clk, input wire rst, output reg Q);
  always @(posedge clk) 
begin  
  if (rst)      Q<=1'b0;     // Asynchronous reset to 0   
 else      Q<=D;        // Sample D on rising edge of clock
  end
endmodule

// 2-bit Up Synchronous Counter using JK Flip-flop
module counter_2bit_up_sync_jk(
    input wire clk,
    input wire rst,
    output wire [1:0] count
);

wire j0, k0, j1, k1;

// For 2-bit up counter: 00->01->10->11->00
// Q0 toggles every clock cycle: J0=1, K0=1
assign j0=1'b1;
assign k0=1'b1;

// Q1 toggles when Q0 is high: J1=Q0, K1=Q0  
assign j1=count[0];
assign k1=count[0];

jk_ff ff0(.j(j0), .k(k0), .clk(clk), .rst(rst), .q(count[0]));
jk_ff ff1(.j(j1), .k(k1), .clk(clk), .rst(rst), .q(count[1]));

endmodule

// 2-bit Down Synchronous Counter using JK Flip-flop
module counter_2bit_down_sync_jk(
    input wire clk,
    input wire rst,
    output wire [1:0] count
);

wire j0, k0, j1, k1;

// For 2-bit down counter: 11->10->01->00->11
// Q0 toggles every clock cycle: J0=1, K0=1
assign j0=1'b1;
assign k0=1'b1;

// Q1 toggles when Q0 is low: J1=~Q0, K1=~Q0
assign j1=~count[0];
assign k1=~count[0];

jk_ff ff0(.j(j0), .k(k0), .clk(clk), .rst(rst), .q(count[0]));
jk_ff ff1(.j(j1), .k(k1), .clk(clk), .rst(rst), .q(count[1]));

endmodule

// 2-bit Up-Down Synchronous Counter using JK Flip-flop
module counter_2bit_updown_sync_jk(
    input wire clk,
    input wire rst,
    input wire up_down, // 1 for up, 0 for down
    output wire [1:0] count
);

wire j0, k0, j1, k1;

// Q0 always toggles: J0=1, K0=1
assign j0=1'b1;
assign k0=1'b1;

// Q1 logic depends on direction
// Up: J1=Q0, K1=Q0
// Down: J1=~Q0, K1=~Q0
assign j1=up_down ? count[0] : ~count[0];
assign k1=up_down ? count[0] : ~count[0];

jk_ff ff0(.j(j0), .k(k0), .clk(clk), .rst(rst), .q(count[0]));
jk_ff ff1(.j(j1), .k(k1), .clk(clk), .rst(rst), .q(count[1]));

endmodule

// 2-bit Ripple Up Counter using D Flip-flop
module counter_2bit_ripple_up_d(
    input wire clk,
    input wire rst,
    output wire [1:0] count
);

// Q0 toggles on every clock edge
d_ff ff0(.D(~count[0]), .clk(clk), .rst(rst), .Q(count[0]));

// Q1 toggles on falling edge of Q0 (ripple effect)
d_ff ff1(.D(~count[1]), .clk(~count[0]), .rst(rst), .Q(count[1]));

endmodule

// 3-bit Ring Counter using D Flip-flop
module counter_3bit_ring_d(
    input wire clk,
    input wire rst,
    output wire [2:0] count
);

// Ring counter: 001->010->100->001...
// Each D input gets the previous Q output (circular)
d_ff ff0(.D(count[2]), .clk(clk), .rst(rst), .Q(count[0]));
d_ff ff1(.D(count[0]), .clk(clk), .rst(rst), .Q(count[1]));
d_ff ff2(.D(count[1]), .clk(clk), .rst(rst), .Q(count[2]));

// Need to initialize to 001 state after reset
// This can be done by setting initial condition in testbench

endmodule

// 3-bit Johnson Counter using D Flip-flop  
module counter_3bit_johnson_d(
    input wire clk,
    input wire rst,
    output wire [2:0] count
);

// Johnson counter: 000->001->011->111->110->100->000...
// Each D input gets the previous Q, except first gets inverted last Q
d_ff ff0(.D(~count[2]), .clk(clk), .rst(rst), .Q(count[0]));
d_ff ff1(.D(count[0]), .clk(clk), .rst(rst), .Q(count[1]));
d_ff ff2(.D(count[1]), .clk(clk), .rst(rst), .Q(count[2]));

endmodule