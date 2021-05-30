`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/18 08:46:21
// Design Name: 
// Module Name: edge_detect
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module edge_detect(
    input           	sys_clk,
    input         	sys_rst_n,
    input	       	i_start,
    output logic	start_flag
  
    );
       logic [1:0] reg_start;
       logic    edge_start;
	   always_ff@(posedge sys_clk)
	   begin
		    if(sys_rst_n==0) reg_start<=2'b00;
		    else  reg_start<={reg_start[0],i_start};
	  end 
		assign	 edge_start =( reg_start[0] & (~reg_start[1]));
        always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) start_flag<=0;
        else if(edge_start) start_flag<=~start_flag;
        else start_flag<=start_flag;
        end

endmodule

