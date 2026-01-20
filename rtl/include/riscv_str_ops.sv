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

    always_ff @(posedge clk)
	  begin
	    if (enable_i) begin
	      case (operator_i)
	        STR_OP_UPPER:
	          $display("%t: Exec Upper instruction", $time);
	        STR_OP_LOWER:
	          $display("%t: Exec Lower instruction", $time);
	        STR_OP_LEET:
	          $display("%t: Exec Leet speak instruction", $time);
	        STR_OP_ROT13:
	          $display("%t: Exec Rot13 instruction", $time);
	      endcase
	    end
	end

	always_comb begin
    	result_o = enable_i ? operand_i : 32'b0;
  end
// git try
    endmodule