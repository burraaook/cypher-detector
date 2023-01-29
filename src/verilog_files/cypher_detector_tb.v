module cypher_detector_tb();

reg [15:0] cypher;
reg [3:0] num;
reg clock = 1'b0;
reg reset;
reg read;

wire right;
wire [7:0] sum;


cypher_detector cd(
	.cypher(cypher),
	.num(num),
	.read(read),
	.clock(clock),
	.reset(reset),
	.sum(sum),
	.right(right)
);

always begin
	#1
	clock = ~clock;
end

initial begin
	reset = 1'b1;
	read = 1'b0;
	
	#2
	reset = 1'b0;
	cypher = 16'b0010_0110_0000_0001;
	read = 1'b1;	
	#2
	num = 4'b0000;
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
	#30
	$stop;
end

	initial
		begin
			$monitor("\nreset = %1b\ncypher = %16b\nnum = %4b\nread = %1b\nright = %1b\nsum = %1d",
					reset, cypher, num, read, right, sum);
		end
endmodule

