module can_top (
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
    can_controller controller (
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
endmodule

