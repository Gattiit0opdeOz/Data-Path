`timescale 1ns/1ns
//1. Crear Modulo -  Definir I/O
module UnidadDeControl(
    input wire [5:0] opcode,
    output reg reg_write,
    output reg mem_to_reg,
    output reg mem_write,
    output reg alu_src,
    output reg [1:0] alu_op
);

//2. Elementos internos
// No se requieren elementos internos adicionales

//3. Cuerpo
    always @(*) begin
        // Valores por defecto
        reg_write = 1'b0;
        mem_to_reg = 1'b0;
        mem_write = 1'b0;
        alu_src = 1'b0;
        alu_op = 2'b00;

        case(opcode)
            6'b000000: begin // Tipo R
                reg_write = 1'b1;
                alu_op = 2'b10;
            end
            default: begin
                reg_write = 1'b0;
                alu_op = 2'b00;
            end
        endcase
    end

endmodule
