

`include "src/MUX.v"

module top (
  input clk,
  input rst
);

reg [2:0] in;
wire out;
always @(posedge clk) begin
  if (rst)
    in <= 0;
  else
    in <= in + 1;
end

MUX test(
  .A(in[2]),
  .B(in[1]),
  .S(in[0]),
  .O(out)
);

endmodule

