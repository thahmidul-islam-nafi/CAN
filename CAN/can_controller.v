module can_controller (
    input wire clk,
    input wire reset,
    input wire [7:0] data_in,
    input wire send,
    input wire can_in,
    output wire can_out,
    output wire [7:0] data_out,
    output wire valid,
    output wire busy
);
    wire tx_busy;
    wire rx_valid;

    can_tx transmitter (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .send(send),
        .can_out(can_out),
        .busy(tx_busy)
    );

    can_rx receiver (
        .clk(clk),
        .reset(reset),
        .can_in(can_in),
        .data_out(data_out),
        .valid(rx_valid)
    );

    assign valid = rx_valid;
    assign busy = tx_busy;
endmodule

