module control_tb();

reg read;
reg stop;
reg reset;
reg clock = 1'b0;

wire sl_res;
wire sl_op;

control cntrl(
	.read(read),
	.stop(stop),
	.reset(reset),
	.clock(clock),
	.sl_res(sl_res),
	.sl_op(sl_op)
);

always begin
	#1
	clock = ~clock;
end

initial begin
	reset = 1'b1;
	read = 1'b0;
	stop = 1'b0;
	
	#2
	reset = 1'b0;
	read = 1'b1;
	
	#15
	stop = 1'b1;
	#2
	read = 1'b0;
	stop = 1'b0;
	#10
	reset = 1'b1;
	#5
	read = 1'b1;
	reset = 1'b0;

	#10
	stop = 1'b1;
	$stop;
end

endmodule

