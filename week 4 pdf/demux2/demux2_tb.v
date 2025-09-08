module TB;
reg s, d;
wire y0, y1;
demux2 uut(.s(s), .d(d), .y0(y0), .y1(y1));
initial begin
s=0;d=0;
#5 s=0;d=1;
#5 s=1;d=0;
#5 s=1;d=1;
end
initial begin
$dumpfile("demux2_test.vcd");
$dumpvars(0,TB);
$monitor("At time %t, s = %b, d = %b, y0 = %b, y1 = %b", $time, s, d, y0, y1);
end
endmodule

