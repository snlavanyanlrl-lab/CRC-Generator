module crc_generator (
    input        clk,
    input        reset,
    input        start,
    input  [7:0]  data_in,
    output reg [3:0] crc_out,
    output reg       done
);

reg [3:0] crc;
reg [3:0] count;
reg [7:0] data_reg;

always @(posedge clk or posedge reset) begin

    if (reset) begin
        crc      <= 4'b0000;
        crc_out  <= 4'b0000;
        count    <= 4'b0000;
        data_reg <= 8'b0;
        done     <= 1'b0;
    end

    else begin

        if (start) begin
            crc      <= 4'b0000;
            count    <= 4'b0000;
            data_reg <= data_in;
            done     <= 1'b0;
        end

        else if (count < 8) begin

            if (crc[3] ^ data_reg[7])
                crc <= {crc[2:0], 1'b0} ^ 4'b0011;
            else
                crc <= {crc[2:0], 1'b0};

            data_reg <= {data_reg[6:0], 1'b0};
            count <= count + 1'b1;

        end

        else begin
            crc_out <= crc;
            done    <= 1'b1;
        end

    end

end

endmodule