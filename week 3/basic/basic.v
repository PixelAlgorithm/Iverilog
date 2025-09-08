module and2(a, b, c);
    input a, b;
    output c;
    assign c = a & b;
endmodule

module or2(a, b, c);
    input a, b;
    output c;
    assign c = a | b;
endmodule

module xor2(a, b, c);
    input a, b;
    output c;
    assign c = a ^ b;
endmodule

module not1(a, c);
    input a;
    output c;
    assign c = ~a;
endmodule