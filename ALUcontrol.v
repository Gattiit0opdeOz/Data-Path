`timescale 1ns/1ns
//1. Crear Modulo -  Definir I/O
module ALUcontrol(
    input wire [1:0] alu_op,
    input wire [5:0] funct,
    output reg [2:0] alu_control
);

//2. Elementos internos
// No se requieren elementos internos adicionales

//3. Cuerpo
    always @(*) begin
        case(alu_op)
            2'b10: begin // Tipo R
                case(funct)
                    6'b100000: alu_control = 3'b001; // ADD
                    6'b100010: alu_control = 3'b010; // SUB
                    6'b101010: alu_control = 3'b011; // SLT
                    6'b100100: alu_control = 3'b100; // AND
                    6'b100101: alu_control = 3'b101; // OR
                    6'b100110: alu_control = 3'b110; // XOR
                    6'b100111: alu_control = 3'b111; // NOR
                    default:   alu_control = 3'b000;
                endcase
            end
            default: alu_control = 3'b000;
        endcase
    end

endmodule
