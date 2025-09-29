// Sequence: 00 → 01 → 10 → 11 → 00 → …
`timescale 1ns/1ps
module dff (
input wire clk,
input wire rst, // async reset, active-high
input wire d,
output reg q
);
always @(posedge clk or posedge rst) begin
if (rst) q <= 1'b0;
else q <= d;
end
endmodule

module ripple_up_counter_2bit (
input wire clk,
input wire rst,
output wire [1:0] q
);
wire q0, q1;
// LSB toggles every system clock
dff ff0 (.clk(clk), .rst(rst), .d(~q0), .q(q0));
// MSB toggles when q0 falls (use posedge of ~q0)
dff ff1 (.clk(~q0), .rst(rst), .d(~q1), .q(q1));
assign q = {q1, q0};
endmodule

module tb_ripple_counter;
reg clk, rst;
wire [1:0] q;

ripple_up_counter_2bit uut (.clk(clk), .rst(rst), .q(q));

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
$dumpfile("ripple_counter.vcd");
$dumpvars(0, tb_ripple_counter);
$display("Time\tClk\tReset\tQ1Q0");
$monitor("%0t\t%b\t%b\t%b%b", $time, clk, rst, q[1], q[0]);
rst = 1; #10;
rst = 0; #80;
rst = 1; #10;
rst = 0; #40;
$finish;
end
endmodule