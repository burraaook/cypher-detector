module cypher_detector(

	input [15:0] cypher,
	input [3:0] num,
	input read,
	input clock,
	input reset,
	
	output [7:0] sum,
	output right
);

// signals between controller and datapath
wire sl_res, sl_op, stop;
wire [7:0] w_sum;

assign sum = w_sum;
assign right = stop;

datapath db(
	.sl_res(sl_res),
	.sl_op(sl_op),
	.clock(clock),
	.cypher(cypher),
	.num(num),
	.stop(stop),
	.sum(w_sum)
);

control cntrl(
	.read(read),
	.stop(stop),
	.reset(reset),
	.clock(clock),
	.sl_res(sl_res),
	.sl_op(sl_op)
);



endmodule

