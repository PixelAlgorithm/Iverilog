module TB;
reg i0,i1,i2,i3;
wire y0,y1;
encoder4x2 uut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.y0(y0),.y1(y1));
initial begin
$dumpfile("encoder4x2_test.vcd");
$dumpvars(0,TB);
end
initial begin
i0=1;i1=0;i2=0;i3=0;
#5 i0=0;i1=1;i2=0;i3=0;
#5 i0=0;i1=0;i2=1;i3=0;
#5 i0=0;i1=0;i2=0;i3=1;
end
initial begin
$monitor("At time %t, i0=%b, i1=%b, i2=%b, i3=%b, y0=%b, y1=%b", $time,i0,i1,i2,i3,y0,y1);
end
endmodule
