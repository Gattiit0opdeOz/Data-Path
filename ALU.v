`timescale 1ns/1ns
//1. Crear Modulo -  Definir I/O
module ALU(
    input wire [31:0] a,
    input wire [31:0] b,
    input wire [2:0] alu_control,
    output reg [31:0] result,
    output wire zero_flag
);

//2. Elementos internos
// No se requieren elementos internos adicionales

//3. Cuerpo
    // Asignación del zero_flag
    assign zero_flag = (result == 32'b0);

    // Operaciones ALU
    always @(*) begin
        case(alu_control)
            3'b001: result = a + b;          // ADD
            3'b010: result = a - b;          // SUB
            3'b011: result = (a < b) ? 1 : 0; // SLT
            3'b100: result = a & b;          // AND
            3'b101: result = a | b;          // OR
            3'b110: result = a ^ b;          // XOR
            3'b111: result = ~(a | b);       // NOR
            default: result = 32'b0;
        endcase
    end

endmodule
