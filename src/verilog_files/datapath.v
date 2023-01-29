module datapath(
	input sl_res,
	input sl_op,
	input clock,
	input [15:0] cypher,
	input [3:0] num,
	output stop,
	output [7:0] sum);
	
	// registers
	reg [15:0] reg_4bits;
	reg [7:0] reg_sum;
	
	// wires
	wire [7:0] n_sum;
	wire [15:0] n_4bits;
	wire [7:0] w_sum;
	wire [15:0] w_4bits;
	
	// sum and shift operations
	assign n_sum = {4'b0, num} + reg_sum;
	assign n_4bits = {reg_4bits[11:0], num};
	
	
	// multiplexers
	assign w_sum = sl_res ? 8'b0:(sl_op ? n_sum: reg_sum);
	assign w_4bits = sl_res ? 16'b0:(sl_op ? n_4bits: reg_4bits);
	
	// stop bit
	assign stop = {reg_4bits[3:0], reg_4bits[7:4], reg_4bits[11:8], reg_4bits[15:12]} == cypher;
	assign sum = reg_sum;
	
	initial begin
		reg_4bits = 0;
		reg_sum = 0;
	end
	
	
	always @ (posedge clock) begin
		
//		if(sl_op || sl_res)
//		begin
			reg_sum <= w_sum;
			reg_4bits <= w_4bits;		
//		end
	end
endmodule
