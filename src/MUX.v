

module MUX(
  input A,
  input B,
  input S,
  output O
);

assign O = A & S | B & !S;

endmodule

