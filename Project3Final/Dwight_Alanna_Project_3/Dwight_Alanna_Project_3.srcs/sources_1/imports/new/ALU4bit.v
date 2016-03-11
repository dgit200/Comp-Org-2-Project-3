`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2016 02:45:05
// Design Name: 
// Module Name: ALU4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU4bit(a, b,  cin, less, op, result, cout, set, zero, G, P);
    
    input [3:0] a, b;
    input cin, less;
    input [2:0] op; // op[2] is "binv". op[1:0] denotes the 2-bit operation.
    output [3:0] result;
    output cout, set, zero, G, P;
    
    wire g0, g1, g2, g3;
    wire p0, p1, p2, p3;
    wire c0, c1, c2, c3;
    
    ALU1Bit a0(a[0], b[0], cin, less, op[2:0], result[0], c0, set, zero, g0, p0),
            a1(a[1], b[1], c0, less, op[2:0], result[1], c1, set, zero, g1, p1),
            a2(a[2], b[2], c1, less, op[2:0], result[2], c2, set, zero, g2, p2),
            a3(a[3], b[3], c2, less, op[2:0], result[3], c3, set, zero, g3, p3);
            
    
    CLA4bit C0(g0, p0, g1, p1, g2, p2, g3, p3, cin, c0, c1, c2, c3, cout, G, P);
    
    assign zero = ~(result[0] | result[1] | result[2] | result[3]);
    assign set = result[3];
    
endmodule