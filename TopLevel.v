`timescale 1ns/1ns
//1. Crear Modulo -  Definir I/O
module TopLevel(
    input wire clk,
    input wire reset,
    input wire [31:0] instruction,
    output wire [31:0] result
);

//2. Elementos internos
wire [5:0] opcode;
wire [5:0] funct;
wire [4:0] rs, rt, rd;
wire [31:0] reg_read_data_1, reg_read_data_2;
wire [2:0] alu_control_wire;
wire reg_write, mem_to_reg, mem_write;
wire [1:0] alu_op;
wire [31:0] alu_result;
wire zero_flag;

//3. Cuerpo
    //Asignaciones
    assign opcode = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign funct = instruction[5:0];

    //Instancias
    UnidadDeControl control_unit(
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_to_reg(mem_to_reg),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .alu_op(alu_op)
    );

    ALUcontrol alu_control_unit(
        .alu_op(alu_op),
        .funct(funct),
        .alu_control(alu_control_wire)
    );

    BancoDeRegistros register_file(
        .clk(clk),
        .reset(reset),
        .reg_write_enable(reg_write),
        .reg_read_addr_1(rs),
        .reg_read_addr_2(rt),
        .reg_write_addr(rd),
        .reg_write_data(alu_result),
        .reg_read_data_1(reg_read_data_1),
        .reg_read_data_2(reg_read_data_2)
    );

    ALU alu_unit(
        .a(reg_read_data_1),
        .b(reg_read_data_2),
        .alu_control(alu_control_wire),
        .result(alu_result),
        .zero_flag(zero_flag)
    );

    assign result = alu_result;

endmodule
