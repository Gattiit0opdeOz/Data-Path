`timescale 1ns/1ns
//1. Crear Modulo -  Definir I/O
module BancoDeRegistros(
    input wire clk,
    input wire reset,
    input wire reg_write_enable,
    input wire [4:0] reg_read_addr_1,
    input wire [4:0] reg_read_addr_2,
    input wire [4:0] reg_write_addr,
    input wire [31:0] reg_write_data,
    output wire [31:0] reg_read_data_1,
    output wire [31:0] reg_read_data_2
);

//2. Elementos internos
reg [31:0] registers [0:31]; // Array de 32 registros de 32 bits
integer i;

//3. Cuerpo
    // Lectura asíncrona
    assign reg_read_data_1 = registers[reg_read_addr_1];
    assign reg_read_data_2 = registers[reg_read_addr_2];

    // Escritura síncrona
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Inicializar todos los registros a 0
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end 
        else if (reg_write_enable && reg_write_addr != 0) begin
            // Escribir datos solo si reg_write_enable está activo y no es el registro 0
            registers[reg_write_addr] <= reg_write_data;
        end
    end

endmodule
