module can_rx (
    input wire clk,
    input wire reset,
    input wire can_in,
    output reg [7:0] data_out,
    output reg valid
);
    // Receive logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_out <= 8'b0;
            valid <= 0;
        end else if (can_in) begin
            data_out <= {data_out[6:0], can_in}; // Shift-in data
            valid <= 1;
        end else begin
            valid <= 0;
        end
    end
endmodule

