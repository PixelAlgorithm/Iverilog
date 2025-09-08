module bcd_adder_tb;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    bcd_adder uut(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("bcd_adder_tb.vcd");
        $dumpvars(0, bcd_adder_tb);
        $display("Time | a | b | cin | sum | cout");
        $monitor("%4d | %d | %d | %b | %d | %b", $time, a, b, cin, sum, cout);
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 2; cin = 0; #10;
        a = 0; b = 3; cin = 0; #10;
        a = 0; b = 4; cin = 0; #10;
        a = 0; b = 5; cin = 0; #10;
        a = 0; b = 6; cin = 0; #10;
        a = 0; b = 7; cin = 0; #10;
        a = 0; b = 8; cin = 0; #10;
        a = 0; b = 9; cin = 0; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 2; cin = 0; #10;
        a = 1; b = 3; cin = 0; #10;
        a = 1; b = 4; cin = 0; #10;
        $finish;
    end
endmodule
