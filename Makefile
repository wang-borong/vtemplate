# Makefile template to develop digital circuits
# with iverilog and gtkwave

SIM_TOOL := iverilog
SIM_EXEC := vvp
WAVE_TOOL := gtkwave

ifdef TOP
	BIN := $(TOP).vvp
	SIMOPTS += -s $(TOP) -o $(TOP).vvp
else
	# let the iverilog to get the topmodule
	BIN := a.out
endif

VSRC = $(wildcard src/*.v)

# find the dumpfile name from v sources
WAVE_FILE := $(shell grep dumpfile $(VSRC) | \
			 sed -E "s/.*dumpfile.*\"(.*)\".*/\1/")
ifndef WAVE_FILE
	$(error Can not get wave file!)
endif

.PHONY: all clean sim wave

all: $(BIN)

$(BIN): $(VSRC)
	@$(SIM_TOOL) $(SIMOPTS) $^

sim: $(BIN)
	@$(SIM_EXEC) $(BIN)

wave: sim
	@$(WAVE_TOOL) $(WAVE_FILE) &

clean:
	@$(RM) *.vvp *.vcd a.out
