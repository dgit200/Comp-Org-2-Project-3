module ALU1Bit(a, b, cin, less, op, result, cout, set, zero, g, p);
input a, b, cin, less;
input [2:0] op;
output result, cout, set, zero, g, p;

wire w_and, w_or, w_sum, w_bint;

mux1bit2to1 mux21a(b, ~b, op[2], w_bint);

assign w_and = (a & w_bint);				// AND operation
assign w_or  = (a | w_bint);				// OR operation
assign w_sum = (a ^ w_bint ^ cin);			// SUM of a, bint and cin
assign cout  = ((a & w_bint) | ( a & cin) | (w_bint & cin));	// set carryout.
assign set = w_sum;

assign g = w_and;
assign p = w_or;

wire [3:0] pass;

assign pass[0] = w_and;
assign pass[1] = w_or;
assign pass[2] = w_sum;
assign pass[3] = less;

mux1bit4to1		mux41a(pass[3:0], op[1:0], result);

assign zero = ~result;						// zero is 1 if result is 0.

endmodule
