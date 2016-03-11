`timescale 1ns / 1ps

module ALU4Bit_tb();

    reg [3:0] a, b;
    reg [2:0] op;
    reg cin, less;
    wire [3:0] result;
    wire cout, set, zero, G, P;
    integer i, j;
    
    ALU4bit DUT (.a(a), .b(b), .cin(cin), .op(op),
         .result(result), .cout(cout), .set(set), .zero(zero), .G(G), .P(P));
    
    initial
    begin
        a = 0;
        b = 0;
        cin = 0;
        less = 0;
        
        // test add
        op = 3'b010;
        for (i = 0; i < 16; i = i + 1)
        begin
            a = i;
            for (j = 0; j < 16; j = j + 1)
            begin
                #1 b = j;
            end
        end
        
        // test sub
        op = 3'b110;
        for (i = 0; i < 16; i = i + 1)
        begin
            a = i;
            for (j = 0; j < 16; j = j + 1)
            begin
                #1 b = j;
            end
        end

        // test and
        op = 3'b000;
        for (i = 0; i < 16; i = i + 1)
        begin
            a = i;
            for (j = 0; j < 16; j = j + 1)
            begin
                #1 b = j;
            end
        end
        
         // test or
        op = 3'b001;
        for (i = 0; i < 16; i = i + 1)
        begin
            a = i;
            for (j = 0; j < 16; j = j + 1)
            begin
                #1 b = j;
            end
        end
        
       // test slt
       op = 3'b111;
       less = 1;
       for (i = 0; i < 16; i = i + 1)
       begin
           a = i;
           for (j = 0; j < 16; j = j + 1)
           begin
               #1 b = j;
           end
       end
    end
 endmodule
 