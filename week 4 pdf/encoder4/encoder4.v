module encoder4x2(input wire i0,input wire i1,input wire i2,input wire i3,output wire y0,output wire y1);
assign y0=i1|i3;
assign y1=i2|i3;
endmodule
