module demux2(input wire s,input wire d,output wire y0,output wire y1);
assign y0=~s?d:1'b0;
assign y1=s?d:1'b0;
endmodule
