module tb_ring_counter;
reg clk, reset;
wire [2:0] q;

ring_counter_3bit uut (.clk(clk), .reset(reset), .q(q));

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
$dumpfile("ring_counter_3bit.vcd");
$dumpvars(0, tb_ring_counter);
$display("Time\tClk\tReset\tQ2Q1Q0");
$monitor("%0t\t%b\t%b\t%b%b%b", $time, clk, reset, q[2], q[1], q[0]);
reset = 1; #10;
reset = 0;
// Force initial state to 001 for ring counter
force uut.dff0.Q = 1'b1;
force uut.dff1.Q = 1'b0;
force uut.dff2.Q = 1'b0;
#1;
release uut.dff0.Q;
release uut.dff1.Q;
release uut.dff2.Q;
#60; // Run for 6 cycles to see full ring pattern
reset = 1; #10;
reset = 0; #30;
$finish;
end
endmodule