module and2(c,a,b);
input a,b;
output c;
assign c = a | b;

initial begin
	$monitor("a=%b, b=%b, c=%b", a, b, c);
end

endmodule