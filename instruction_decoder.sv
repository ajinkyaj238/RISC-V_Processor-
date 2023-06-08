`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Northeastern University
// Engineer: Ajinkya Joshi
// Create Date: 05/30/2023 05:28:17 PM
// Module Name: instruction_decoder
//////////////////////////////////////////////////////////////////////////////////


module instruction_decoder(immediate, nzimm, offset, opcode, RegWrite, RegDst, instr_i, ALUSrc1, ALUSrc2, ALUOp, MemWrite, MemToReg, Regsrc);

    input logic [6:0] immediate;
    input logic signed[5:0] nzimm;
    input logic [8:0] offset;
    input logic [3:0] opcode; 
    output logic [15:0] instr_i;
    output logic RegWrite, RegDst, ALUSrc1, ALUSrc2, MemWrite, MemToReg, Regsrc; 
    output logic [3:0] ALUOp;
    
    
    always_comb begin
    case(opcode)
    
        4'b0000: begin
            RegWrite = 1'b1; 
            RegDst = 1'b1;
            ALUSrc2 = 1'b1; 
            MemWrite = 1'b0; 
            MemToReg = 1'b1; 
            Regsrc = 1'b0;   
        end 
        
        4'b0001: begin
            RegWrite = 1'b0; 
            RegDst = 1'b0;
            instr_i = 16'(immediate);
            ALUSrc1 = 1'b0;
            ALUSrc2 = 1'b1; 
            ALUOp = 4'b0;
            MemWrite = 1'b1; 
            Regsrc = 1'b0;   
        end   
        
        4'b0010: begin
            RegWrite = 1'b1; 
            RegDst = 1'b1;
            ALUSrc1 = 1'b0; 
            ALUSrc2 = 1'b0; 
            ALUOp = 4'b0;
            MemWrite = 1'b0; 
            MemToReg = 1'b0; 
            Regsrc = 1'b1;   
        end 
          
        4'b0011: begin
            RegWrite = 1'b1; 
            RegDst = 1'b1;
            instr_i = 16'(nzimm);
            ALUSrc1 = 1'b0; 
            ALUSrc2 = 1'b1; 
            ALUOp = 4'b0;
            MemWrite = 1'b0; 
            MemToReg = 1'b0; 
            Regsrc = 1'b1;   
        end 
        
        4'b0100: begin
            RegWrite = 1'b1; 
            RegDst = 1'b1;
            ALUSrc1 = 1'b0; 
            ALUSrc2 = 1'b0; 
            ALUOp = 4'b0010;
            MemWrite = 1'b0; 
            MemToReg = 1'b0; 
            Regsrc = 1'b1;   
        end 
        
        4'b0101: begin
            RegWrite = 1'b1; 
            RegDst = 1'b1;
            instr_i = 16'(immediate);
            ALUSrc1 = 1'b0; 
            ALUSrc2 = 1'b1; 
            ALUOp = 4'b0010;
            MemWrite = 1'b0; 
            MemToReg = 1'b0; 
            Regsrc = 1'b1;   
        end 
     
        4'b0110: begin
            RegWrite = 1'b1; 
            RegDst = 1'b1;
            ALUSrc1 = 1'b0; 
            ALUSrc2 = 1'b0; 
            ALUOp = 4'b0011;
            MemWrite = 1'b0; 
            MemToReg = 1'b0; 
            Regsrc = 1'b1;   
        end 
            
       4'b0111: begin
            RegWrite = 1'b1; 
            RegDst = 1'b1;
            ALUSrc1 = 1'b0; 
            ALUSrc2 = 1'b0; 
            ALUOp = 4'b1000;
            MemWrite = 1'b0; 
            MemToReg = 1'b0; 
            Regsrc = 1'b1;   
        end
        
        4'b1000: begin
            RegWrite = 1'b1; 
            RegDst = 1'b1;
            instr_i = 16'(nzimm);
            ALUSrc1 = 1'b0; 
            ALUSrc2 = 1'b1; 
            ALUOp = 4'b0100;
            MemWrite = 1'b0; 
            MemToReg = 1'b0; 
            Regsrc = 1'b1;   
        end
        
        4'b1001: begin
            RegWrite = 1'b1; 
            RegDst = 1'b1;
            instr_i = 16'(nzimm);
            ALUSrc1 = 1'b0; 
            ALUSrc2 = 1'b1; 
            ALUOp = 4'b0101;
            MemWrite = 1'b0; 
            MemToReg = 1'b0; 
            Regsrc = 1'b1;   
        end
        
        4'b1010: begin
            RegWrite = 1'b0; 
            instr_i = 16'(offset);
            ALUSrc1 = 1'b1; 
            ALUSrc2 = 1'b1; 
            ALUOp = 4'b0110;
            MemWrite = 1'b0; 
            MemToReg = 1'b0; 
            Regsrc = 1'b0;   
        end  
        
        4'b1011: begin
            RegWrite = 1'b0; 
            instr_i = 16'(offset);
            ALUSrc1 = 1'b1; 
            ALUSrc2 = 1'b1; 
            ALUOp = 4'b0111;
            MemWrite = 1'b0; 
            MemToReg = 1'b0; 
            Regsrc = 1'b0;   
        end
                                                     
    endcase

end
endmodule
