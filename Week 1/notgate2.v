    module and2_test;
reg a;
wire c;
not and2_test(c,a);
initial
begin
#000 a=0;
#100 a=1;
#100;
end
initial
begin
$monitor($time,"a=%b , c=%b",a,c);
end
initial
begin
$dumpfile("not2_test.vcd");
  $dumpvars(0,and2_test);
end
endmodule