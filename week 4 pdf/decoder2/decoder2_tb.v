module decoder_TB;
reg a,b;
wire y0,y1,y2,y3;
decoder2x4 uut(.a(a),.b(b),.y0(y0),.y1(y1),.y2(y2),.y3(y3));
initial begin
$dumpfile("decoder2_test.vcd");
$dumpvars(0,TB);
end
initial begin
a=0;b=0;
#5 a=0;b=1;
#5 a=1;b=0;
#5 a=1;b=1;
end
initial begin
$monitor("At time %t, a=%b, b=%b, y0=%b, y1=%b, y2=%b, y3=%b", $time,a,b,y0,y1,y2,y3);
end
endmodule
