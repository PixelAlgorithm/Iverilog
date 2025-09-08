module and2(c,a);
input a;
output c;
assign c = ~a;

initial begin
	$monitor("a=%b, c=%b", a, c);
end

endmodule