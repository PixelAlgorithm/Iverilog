module mux4 (input wire [3:0] i, input wire j1, j0, output wire o);
wire t0, t1;
mux2 mux2_0 (.i0(i[0]), .i1(i[1]), .j(j0), .o(t0));
mux2 mux2_1 (.i0(i[2]), .i1(i[3]), .j(j0), .o(t1));
mux2 mux2_2 (.i0(t0), .i1(t1), .j(j1), .o(o));
endmodule