`timescale 1ns/1ps
module tb_updown_counter_2bit;
reg clk = 0;
reg rst = 1;
reg up_down = 1;
wire [1:0] q;
updown_counter_2bit dut (.clk(clk), .rst(rst), .up_down(up_down), .q(q));
// 10 ns period clock 
always #5 clk = ~clk;
// Print after each synchronous update
always @(posedge clk) begin
$display("%0t clk=%0b rst=%0b upDn=%0b Q=%0b%0b",
$time, clk, rst, up_down, q[1], q[0]);
end
initial begin
$dumpfile("updown_2bit_jk.vcd");
$dumpvars(0, tb_updown_counter_2bit);
// Keep reset high for one edge -> Q becomes 00 at first posedge
@(negedge clk); rst = 1;
@(negedge clk); rst = 0; // release just before a posedge
// Count UP to reach 11: 00 -> 01 -> 10 -> 11
up_down = 1;
repeat (3) @(negedge clk); // change only on negedge
// Now count DOWN: 11 -> 10 -> 01 -> 00
up_down = 0;
repeat (3) @(negedge clk);
$finish;
end
endmodule