module CPU_02(input logic clk, rst); //Definir as entradas

	logic [31:0] w_Inst;
	logic [7:0] w_PC, w_PCp4, w_rd2, w_SrcB, w_rd1SrcA, w_Result, w_Wd3, w_Imm, w_RData;
	logic [2:0] w_ULAControl;
	logic w_ULASrc, w_RegWrite, w_MemWrite, w_ResultSrc, w_ImmSrc; 
	logic [7:0] reg_aux [7:0]; 

	PC pc0(.PCin(w_PCp4), .PC(w_PC), .clk(clk), .rst(rst));
	Instr_Mem IM0(.A(w_PC), .RD(w_Inst));
	Control_Unit CU0(.Op(w_Inst[6:0]), .Funct3(w_Inst[14:12]), .Funct7(w_Inst[31:25]), .ResultSrc(w_ResultSrc), .MemWrite(w_MemWrite), .ULAControl(w_ULAControl), .ULASrc(w_ULASrc), .ImmSrc(w_ImmSrc), .regWrite(w_RegWrite));
	RegisterFile RF0(.clk(clk), .rst(rst), .ra1(w_Inst[19:15]), .ra2(w_Inst[24:20]), .wa3(w_Inst[11:7]), .wd3(w_Result), .we3(w_RegWrite), .rd1(w_rd1SrcA), .rd2(w_rd2), .S0(reg_aux[0]), .S1(reg_aux[1]), .S2(reg_aux[2]), .S3(reg_aux[3]), .S4(reg_aux[4]), .S5(reg_aux[5]), .S6(reg_aux[6]), .S7(reg_aux[7]));
	ULA ula0(.ULAControl(w_ULAControl), .SrcA(w_rd1SrcA), .SrcB(w_SrcB), .ULAResult(w_Result));
	Data_Mem DM0(.clk(clk), .rst(rst), .A(w_Result), .WE(w_MemWrite), .RD(w_RData), .WD(w_rd2));
	
	assign w_Wd3 = w_ResultSrc ? w_RData : w_Result;
	assign w_Imm = w_ImmSrc ? {w_Inst[31:25], w_Inst[11:7]} : w_Inst[31:20];
	assign w_SrcB = w_ULASrc ? w_Imm : w_rd2;
	assign w_PCp4 = w_PC + 4;


endmodule
