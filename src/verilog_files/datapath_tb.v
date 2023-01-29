module datapath_tb();

reg [15:0] cypher;
reg [3:0] num;
reg clock = 1'b0;
reg sl_res;
reg sl_op;

wire stop;
wire [7:0] sum;

datapath db(
	.sl_res(sl_res),
	.sl_op(sl_op),
	.clock(clock),
	.cypher(cypher),
	.num(num),
	.stop(stop),
	.sum(sum)
);

always begin
	#1
	clock = ~clock;
end

initial begin
	sl_res = 1'b1;
	sl_op = 1'b0;
	
	#2
	sl_res = 1'b0;
	
	cypher = 16'b0010_0110_0000_0001;
	num = 4'b0000;
	sl_op = 1'b1;
	#2
	num = 4'b0001;
	#2
	num = 4'b0011;
	#2
	num = 4'b0000;
	#2
	num = 4'b0011;	
	#2
	num = 4'b0100;
	#2
	num = 4'b0001;
	#2
	num = 4'b0000;
	#2
	num = 4'b0010;
	#2
	num = 4'b0001;
	#2
	num = 4'b0001;
	#2
	num = 4'b0000;
	#2
	num = 4'b0110;
	#2
	num = 4'b0010;
	#2
	sl_op = 0;
	#30
	
	#30
	$stop;	
end

	initial
		begin
			$monitor("\nsl_res = %1b, sl_op = %1b\ncypher = %16b\nnum = %4b\nstop = %1b\nsum = %8b\n",
					sl_res, sl_op, cypher, num, stop, sum);
		end

endmodule
