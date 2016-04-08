module main(LEDR, SW, CLOCK_50);
    output wire [3:0] LEDR;
    input [9:9] SW;
    input CLOCK_50;

    wire clk;
    wire reset;

    clockdiv div(clk, CLOCK_50);
    // buffer the reset button to avoid metastability problems.
    buffer resetBuff(reset, clk, SW[9]);

    counter cnt(LEDR[3:0], clk, reset);
endmodule