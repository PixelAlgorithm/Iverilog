module tb_up_counter_2bit;
reg clk, reset;
wire [1:0] q;
// Instantiate counter
up_counter_2bit uut (.clk(clk),
.reset(reset), .q(q));
// Clock generation
initial clk = 0;
always #5 clk = ~clk;
// Clock period = 10
initial begin
$dumpfile("up_counter_jk.vcd");
$dumpvars(0, tb_up_counter_2bit);
$display("Time\tClk\tReset\tQ1Q0");
$monitor("%0t\t%b\t%b\t%b%b", $time, clk, reset,
q[1], q[0]);
reset = 1; #10; // Apply reset
reset = 0;
#60; // Run counter for a while
reset = 1; #10; // Reset again
reset = 0;
#40;
$finish;
end
endmodule