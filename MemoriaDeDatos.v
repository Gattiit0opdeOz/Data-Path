`timescale 1ns/1ns
//1. Crear Modulo -  Definir I/O
module MemoriaDeDatos(
    input wire clk,
    input wire mem_write,
    input wire [31:0] address,
    input wire [31:0] write_data,
    output reg [31:0] read_data
);

//2. Elementos internos
reg [31:0] memory [0:255]; // Memoria de 256 palabras de 32 bits

//3. Cuerpo
    // Lectura asíncrona
    always @(*) begin
        read_data = memory[address[7:0]]; // Solo usamos los 8 bits menos significativos
    end

    // Escritura síncrona
    always @(posedge clk) begin
        if (mem_write) begin
            memory[address[7:0]] <= write_data;
        end
    end

endmodule
