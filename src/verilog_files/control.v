module control(

input read,
input stop,
input reset,
input clock,
output reg sl_res,
output reg sl_op);

reg [1:0] current_state, next_state;


// state register
always @ (posedge clock) begin
	if(reset)
		current_state <= 2'b11;
	else
		current_state <= next_state;
end

// next states
always @ (*) begin
	case (current_state)
		2'b00: 
		begin
			if(read)
				next_state = 2'b01;
			else
				next_state = 2'b00;		
		end
		
		2'b01:
		begin
			if(stop)
				next_state = 2'b10;
			else
				next_state = 2'b01;
		end
		
		2'b10:
		begin
			if(reset)
				next_state = 2'b11;
			else
				next_state = 2'b10;
		end
		
		2'b11:
		begin
			next_state = 2'b00;
		end
	endcase
end

// output signals
always @(*) begin
	sl_res = 1'b0;
	sl_op = 1'b0;
	
	case(current_state)
		2'b00:
		begin
			if(read)
				sl_op = 1'b1;
		end
		
		2'b01:
		begin
			if(~stop)
				sl_op = 1'b1;
		end
		
//		2'b10:
//		begin
//			sl_op = 1'b0;
//			sl_res = 1'b0;
//		end
//		
		2'b11:
		begin
			sl_res = 1'b1;
		end
	endcase
end

endmodule
				
				