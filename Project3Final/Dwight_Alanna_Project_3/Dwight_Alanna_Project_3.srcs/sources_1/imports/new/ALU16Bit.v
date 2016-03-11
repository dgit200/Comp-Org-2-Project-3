`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2016 03:22:07
// Design Name: 
// Module Name: ALU16Bit
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


module ALU16Bit(a, b, cin, less, op, result, cout, set, zero, G, P);
    
    input [15:0] a, b;
    input cin, less;
    input [2:0] op; // op[2] is "binv". op[1:0] denotes the 2-bit operation.
    output [15:0] result;
    output cout, set, zero, G, P;
    
    wire c0, c1, c2;
    wire g0, g1, g2;
    wire p0, p1, p2;
    
    ALU4bit a0(a[3:0], b[3:0], cin, less, op[2:0], result[3:0], c0, set, zero, g0, p0),
            a1(a[7:4], b[7:4], c0, less, op[2:0], result[7:4], c1, set, zero, g1, p1),
            a2(a[11:8], b[11:8], c1, less, op[2:0], result[11:8], c2, set, zero, g2, p2),
            a3(a[15:12], b[15:12], c2, less, op[2:0], result[15:12], cout, set, zero, G, P); 
    
    assign zero = ~(|result);
    assign set = result[15];
    
endmodule
