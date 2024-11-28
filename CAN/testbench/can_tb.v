`timescale 1ns / 1ps

module can_tb;

    // Testbench Signals
    reg clk;
    reg reset;
    reg [7:0] data_in;
    reg send;
    reg can_in;
    wire can_out;
    wire [7:0] data_out;
    wire valid;
    wire busy;

    // Instantiate the CAN Top Module
    can_top uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .send(send),
        .can_in(can_in),
        .can_out(can_out),
        .data_out(data_out),
        .valid(valid),
        .busy(busy)
    );

    // Clock Generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test Procedure
    initial begin
        // Initialize signals
        reset = 1;
        data_in = 8'h00;
        send = 0;
        can_in = 0;

        // Reset the system
        #20;
        reset = 0;

        // Transmit a message
        data_in = 8'hA5; // Example data
        send = 1;
        #10;
        send = 0;

        // Simulate reception of the message
        #50;
        can_in = 1; #10; can_in = 0;
        can_in = 1; #10; can_in = 0;

        // Wait and observe
        #100;

        // End simulation
        $stop;
    end
endmodule

