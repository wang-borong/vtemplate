`timescale 1ns/1ns

module template_tb;

// reg a;
// wire out;
// template template_u0 (.a(a), .out(out));

initial
begin
    $dumpfile("template_tb.vcd");
    $dumpvars;
end

endmodule
