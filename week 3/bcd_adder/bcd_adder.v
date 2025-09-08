module bcd_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire [3:0] temp_sum;
    wire temp_cout;
    wire correction;
    wire [3:0] correction_val;
    wire [3:0] final_sum;
    wire final_cout;
    ripple_carry_adder rca(.a(a), .b(b), .cin(cin), .sum(temp_sum), .cout(temp_cout));
    assign correction = temp_cout | (temp_sum[3] & (temp_sum[2] | temp_sum[1]));
    assign correction_val = correction ? 4'b0110 : 4'b0000;
    ripple_carry_adder rca_correction(.a(temp_sum), .b(correction_val), .cin(1'b0), .sum(sum), .cout(cout));
endmodule
