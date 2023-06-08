`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Northeastern University
// Engineer: Ajinkya Joshi
// Create Date: 06/05/2023 07:16:19 PM
// Module Name: program_counter 
//////////////////////////////////////////////////////////////////////////////////


module program_counter(clk, rst, pc);

    input logic clk, rst; 
    output logic [7:0] pc; 
    
    always @ (posedge clk, posedge rst) begin
        if (rst) pc = 0;
        else pc = pc + 1;  
    end
    
endmodule
