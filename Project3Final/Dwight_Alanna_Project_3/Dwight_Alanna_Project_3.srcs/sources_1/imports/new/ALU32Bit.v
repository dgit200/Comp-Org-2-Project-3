`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2016 03:38:13
// Design Name: 
// Module Name: ALU32Bit
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


module ALU32Bit(a, b, op, result, zero);
    
    input [31:0] a, b;
    input [2:0] op; // op[2] is "binv". op[1:0] denotes the 2-bit operation.
    output [31:0] result;
    output zero; // zero is 1 if the result is 0x00000000. Otherwise, it is 0
    
    wire c0, c1;
    wire g0, g1, p0, p1;
    wire set, less;
    
    ALU16Bit a0(a[15:0], b[15:0], op[2],less, op[2:0], result[15:0], c0, set, zero, g0, p0),
             a1(a[31:16], b[31:16], c0, less, op[2:0], result[31:16], c1, set, zero, g1, p1);
             
     assign zero = ~(|result);
    
endmodule
