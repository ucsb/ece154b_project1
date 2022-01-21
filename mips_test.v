`timescale 1ps/1ps

module MIPS_TEST();
    reg clk = 0;
    reg rst = 0;
    initial begin
        forever begin
            clk <= ~clk;
            #5;
        end
    end

    wire [31:0] writedata, dataadr, readdata, instr;
    wire        memwrite;

    top DUT(clk, rst, writedata, readdata, dataadr, memwrite, instr);

    initial begin
        $dumpfile("top_test_dump.vcd");
        $dumpvars;
        $readmemh("memfile.dat",MIPS_TEST.DUT.imem.RAM); // initialize memory with test program. Change this with memfile2.dat for the modified code
        rst = 1;
        #20;
        rst = 0;
        #100;
        $finish;
    end
endmodule