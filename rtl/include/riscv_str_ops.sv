  // TEST
module riscv_str_ops
import cv32e40p_pkg::*;
	(
	  input logic                    clk,
	  input logic                    enable_i,
      input logic [STR_OP_WIDTH-1:0] operator_i,

	// TEST
	  input logic [31:0]             operand_i,
	  output logic [31:0]            result_o
	);

	logic [31:0] buffer;

    always_comb
	  begin
	    if (enable_i) begin
	      case (operator_i)
	        STR_OP_UPPER:begin
	          $display("%t: Exec Upper instruction", $time);
				buffer = $unsigned(operand_i)-$unsigned(32'h20202020);
			end
	        STR_OP_LOWER:begin
	          $display("%t: Exec Lower instruction", $time);
			  	buffer = operand_i;
			end
	        STR_OP_LEET:begin
	          $display("%t: Exec Leet speak instruction", $time);
			  	  	buffer = operand_i;
			end
	        STR_OP_ROT13:begin
	          $display("%t: Exec Rot13 instruction", $time);
			  	  	buffer = operand_i;
			end
	      endcase
	    end
	end

	always_comb begin
    	result_o = enable_i ?  buffer: 32'b0;
  end
// git try
    endmodule