module buffer(out, clk, inp);
    // only copy input to output during the positive edge of the clock.
    // For synchronous systems, this delays a signal by 1 clock cycle.
    // For async signals, this ensures their input only updates on the posedge.
    // Note that one must *double* buffer async inputs in order to fully avoid metastability
    output out;
    input clk, inp;

    reg buffered;

    assign out = buffered;

    always @(posedge clk)
        buffered <= inp;
endmodule

module buffer2(out, clk, inp);
    // Put a signal behind two buffers.
    // This allows async signals to be sent into the system with very low
    // probability of metastability problems.
    output out;
    input clk, inp;
    wire halfBuffered;

    buffer buff1(halfBuffered, clk, inp);
    buffer buff2(out, clk, halfBuffered);
endmodule