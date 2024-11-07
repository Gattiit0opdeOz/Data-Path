`timescale 1ns/1ns
//1. Crear Modulo -  Definir I/O
module tb_TopLevel();

//2. Elementos internos
reg clk;
reg reset;
reg [31:0] instruction;
wire [31:0] result;

//3.Cuerpo
    //Instancia del módulo a probar
    TopLevel uut(
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .result(result)
    );

    //Generación de reloj
    always #5 clk = ~clk;

    //Bloque initial para pruebas
    initial begin
        // Inicialización
        clk = 0;
        reset = 1;
        instruction = 0;
        
        // Reset
        #10 reset = 0;
        
        // Prueba ADD: $rd = $rs + $rt
        #10 instruction = 32'b000000_00001_00010_00011_00000_100000;
        
        // Prueba SUB: $rd = $rs - $rt
        #10 instruction = 32'b000000_00001_00010_00011_00000_100010;
        
        // Prueba AND: $rd = $rs & $rt
        #10 instruction = 32'b000000_00001_00010_00011_00000_100100;
        
        // Prueba OR: $rd = $rs | $rt
        #10 instruction = 32'b000000_00001_00010_00011_00000_100101;
        
        // Prueba XOR: $rd = $rs ^ $rt
        #10 instruction = 32'b000000_00001_00010_00011_00000_100110;
        
        // Prueba NOR: $rd = ~($rs | $rt)
        #10 instruction = 32'b000000_00001_00010_00011_00000_100111;
        
        // Prueba SLT: if ($rs < $rt) $rd = 1; else $rd = 0
        #10 instruction = 32'b000000_00001_00010_00011_00000_101010;
        
        // Fin de simulación
        #10 $finish;
    end
    
    // Monitoreo
    initial begin
        $monitor("Time=%0t reset=%b instruction=%h result=%h",
                 $time, reset, instruction, result);
    end

endmodule
