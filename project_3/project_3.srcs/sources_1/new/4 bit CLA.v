`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2016 13:10:28
// Design Name: 
// Module Name: 4 b CLA
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


module 4 b CLA(g0, p0, g1, p1, g2, p2, g3, p3, cin, c0, c1, c2, c3, c4, G ,P);

    input g0, p0, g1, p1, g2, p2, g3, p3, cin;
    output c0, c1, c2, c3, 4, G, P;

    wire x0, x1, x2, x3;
    wire y0, y1, y2, y3;
    wire z1, z2, z3;
    
    and #(1) (x0, g0, p0);
    and #(1) (x1, g1, p1);
    and #(1) (x2, g2, p2);
    and #(1) (x3, g3, p3);
    
    xor #(1) (y0, g0, p0);
    xor #(1) (y1, g1, p1);
    xor #(1) (y2, g2, p2);
    xor #(1) (y3, g3, p3);
    
    wire ya, yb, yc, yd, ye, yf;
    wire o0, o1, o2, o3;
    
    and #(1)  (o0, cin, y0);
    and #(1)  (o0, cin, y0, y1);
    and #(1)  (o0, cin, y0, y1, y2);
    and #(1)  (o0, cin, y0, y1, y2, y3);
    
    or #(1) (z1, x0, o0);
    wire xa, xb, xc, xd, xe, xf;
    
    and #(1) (xa, x0, y1);
    and #(1) (xb, x1, y2);
    and #(1) (xc, x0, y1, y2);
    and #(1) (xd, x2,y3);
    and #(1) (xe, x1, y2, y3);
    and #(1)(x, x0, y1, y2, y3);
    
    or #(1) (z2, x1, xa, ya);
    or #(1) (z3, x2, xb, xc, o2);
    or #(1) (cout, x3, xd, xe, xf, o3);
     
    
    
     
     



    );
endmodule
