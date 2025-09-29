module tb_johnson_counter;
reg clk, reset;
wire [2:0] q;

johnson_counter_3bit uut (.clk(clk), .reset(reset), .q(q));

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
$dumpfile("johnson_counter_3bit.vcd");
$dumpvars(0, tb_johnson_counter);
$display("Time\tClk\tReset\tQ2Q1Q0");
$monitor("%0t\t%b\t%b\t%b%b%b", $time, clk, reset, q[2], q[1], q[0]);
reset = 1; #10;
reset = 0; #120; // Run for 12 cycles to see full Johnson sequence
reset = 1; #10;
reset = 0; #40;
$finish;
end
endmodule