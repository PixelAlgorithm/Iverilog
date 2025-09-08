module fulladder_tb;
	reg aa, bb, cc;
	wire ss, cy;

	fulladder uut(.a(aa),.b(bb),.cin(cc),.sum(ss),.cout(cy));

	initial begin
		$dumpfile("fulladder_test.vcd");
		$dumpvars(0, fulladder_tb);
	end

	initial begin
		$monitor($time, "a=%b, b=%b, cin=%b, sum=%b, cout=%b", aa, bb, cc, ss, cy);
		#5 aa=1'b0; bb=1'b0; cc=1'b0;
		#5 aa=1'b0; bb=1'b1; cc=1'b0;
		#5 aa=1'b1; bb=1'b0; cc=1'b0;
		#5 aa=1'b1; bb=1'b1; cc=1'b0;
		#5 aa=1'b0; bb=1'b0; cc=1'b1;
		#5 aa=1'b0; bb=1'b1; cc=1'b1;
		#5 aa=1'b1; bb=1'b0; cc=1'b1;
		#5 aa=1'b1; bb=1'b1; cc=1'b1;
		$finish;
	end
endmodule
