# icarus verilog + gtkwave template

This is a template for developping digital circuits, which
uses open source icarus verilog and gtkwave.

With this template, you just need to install developpment
tools (iverilog and gtkwave) and dedicate to write RTL codes.
After finishing your code, you can use `make` command to 
accomplish the rest work which include elaboration and
simulation.

I will add function of the implementation and the genaration
of bitstream steps for Xilinx FPGA.

## Usage

I create the template for simplify the developpment flow.
Thus, the usage of the template is very easy!  Firstly, clone
and rename the repo.  Secondly, rename the template verilog
sources or replace them with your own.  Finally, remove the
git cache `.git` and initial your new git repo.

The entire commands like this (assume your project name is
`your_project`),

```bash
git clone https://github.com/wang-borong/vtemplate your_project
cd your_project
rm src/*.v
rm -rf .git
git init .
```

The simulation use the `gtkwave` supported vcd wave file which
should be dumped from the test bench.  To dump the wave file,
you can add the below code snippets to your test bench.

```verilog
initial
begin
    $dumpfile("template_tb.vcd");
    $dumpvars;
end
```

The wave file can be named to your topmodule, but it's not
mandatory.  The `Makefile` will find the name automatically
and open it with `gtkwave` when you instruct `make wave`.

If you have several module blocks to be test with individual 
testbench, you can specify the testbench file name by
`make TESTBENCH=src/testbench_name`.


That's all.
