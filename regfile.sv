`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Northeastern University
// Engineer: Ajinkya Joshi
// Create Date: 05/17/2023 05:58:39 PM
// Module Name: reg_file
// Project Name: Lab 3
//////////////////////////////////////////////////////////////////////////////////

module regfile(rst, clk, rd0_addr, rd1_addr, wr_addr, wr_data, wr_en, rd0_data, rd1_data); 

input logic rst, clk, wr_en; 
input logic [2:0] rd0_addr, rd1_addr, wr_addr; 
input logic [15:0] wr_data; 
output logic [15:0] rd0_data,  rd1_data; 

// created a for loop for register. 
reg [15:0]reggae[0:7];

// writing to the module register 
always_ff@(posedge clk, negedge rst)begin
    if (rst == 1'b0)begin
        for (int i =0; i< $size(reggae); i++)
            reggae[i] = 0;
    end 
   else if (wr_en == 1'b1)begin
        reggae[wr_addr] = wr_data; 
    end
   else begin
        rd0_data = reggae[rd0_addr];
        rd1_data = reggae[rd1_addr];
    end
         
end
endmodule
