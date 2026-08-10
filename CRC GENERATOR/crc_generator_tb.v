`timescale 1ns/1ps

module crc_generator_tb;

reg clk;
reg reset;
reg start;
reg [7:0] data_in;

wire [3:0] crc_out;
wire done;

crc_generator uut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .data_in(data_in),
    .crc_out(crc_out),
    .done(done)
);

// Clock generation
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin

    $display("---------------------------------------------");
    $display("          CRC Generator Simulation");
    $display("---------------------------------------------");
    $display("Data       CRC");
    $display("---------------------------------------------");

    // Reset
    reset = 1'b1;
    start = 1'b0;
    data_in = 8'b0;

    #10;

    reset = 1'b0;

    // Test Case 1
    data_in = 8'b10101010;
    start = 1'b1;
    #10;
    start = 1'b0;

    wait(done);
    #5;

    $display("%b    %b", data_in, crc_out);

    // Reset for next test
    reset = 1'b1;
    #10;
    reset = 1'b0;

    // Test Case 2
    data_in = 8'b11001100;
    start = 1'b1;
    #10;
    start = 1'b0;

    wait(done);
    #5;

    $display("%b    %b", data_in, crc_out);

    // Reset for next test
    reset = 1'b1;
    #10;
    reset = 1'b0;

    // Test Case 3
    data_in = 8'b11110000;
    start = 1'b1;
    #10;
    start = 1'b0;

    wait(done);
    #5;

    $display("%b    %b", data_in, crc_out);

    $display("---------------------------------------------");
    $display("Simulation Completed Successfully.");
    $display("---------------------------------------------");

    $finish;

end

endmodule