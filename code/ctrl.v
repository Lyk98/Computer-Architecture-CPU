`include "defines.v"

module ctrl(

	input wire				     rst,

	input wire                   stallreq_from_id_load,
	
	input wire                   stallreq_from_id_branch,

	output reg[5:0]              stall       
	
);


	always @ (*) begin
		if(rst == `RstEnable) begin
			stall <= 6'b000000;
		end else if(stallreq_from_id_branch == `Stop) begin
			stall <= 6'b000010;
		end else if(stallreq_from_id_load == `Stop) begin
			stall <= 6'b000111;			
		end else begin
			stall <= 6'b000000;
		end    //if
	end      //always
			

endmodule