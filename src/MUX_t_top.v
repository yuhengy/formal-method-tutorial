

`include "src/MUX_t.v"

module top (
  input clk,
  input rst
);

reg [5:0] in;
wire out, out_t;
always @(posedge clk) begin
  if (rst)
    in <= 0;
  else
    in <= in + 1;
end

MUX test(
  .A(in[5]),
  .B(in[4]),
  .S(in[3]),
  .A_t(in[2]),
  .B_t(in[1]),
  .S_t(in[0]),
  .O(out),
  .O_t(out_t)
);

endmodule

