`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Northeastern University
// Engineer: Ajinkya Joshi
// Create Date: 05/17/2023 07:01:14 PM
// Module Name: mux2_file
//////////////////////////////////////////////////////////////////////////////////
 
module TwoToOneMux(a, b, sel_mux, out);
 
input logic [15:0] a, b;
input logic sel_mux;
output logic [15:0] out;
 
assign out = (sel_mux == 1'b0)? a : b;
 
endmodule
