module fulladder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;
    wire w1, w2, w3, w4, w5;

    xor2 x1(a, b, w1);
    xor2 x2(w1, cin, sum);

    and2 a1(a, b, w2);
    and2 a2(b, cin, w3);
    and2 a3(a, cin, w4);
    or2 o1(w2, w3, w5);
    or2 o2(w5, w4, cout);
endmodule
