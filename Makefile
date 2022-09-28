FRONTC_FILES=c/frontc/cabs.ml c/frontc/cparser.mli c/frontc/clexer.ml c/frontc/cparser.ml c/frontc/frontc.ml

C_FILES=c/c_ast.ml c/frontc/cprint.mli c/frontc/cprint.ml c/c_desugar.ml c/c_typecheck.ml c/c.ml

LLVM_FILES=llvm/llvm_ast.ml llvm/llvm_print.mli llvm/llvm_print.ml llvm/llvm_interp.mli llvm/llvm_interp.ml llvm/llvm_utils.ml llvm/llvm_bbcfg.ml llvm/llvm_typecheck.ml llvm/llvm_ssa.ml llvm/LLVM.ml

UTILS_FILES=utils/varmap.ml utils/graph.ml utils/config.ml

OTHER_FILES=cllvm.ml main.ml

INCLUDES=-I c/ -I c/frontc -I llvm/ -I utils/

BINS=main

all: $(UTILS_FILES) $(FRONTC_FILES) $(C_FILES) $(LLVM_FILES) $(OTHER_FILES)
	ocamlopt -g -o main $(INCLUDES) $(UTILS_FILES) $(FRONTC_FILES) $(C_FILES) $(LLVM_FILES) $(OTHER_FILES)

c/frontc/cparser.ml: c/frontc/clexer.mll c/frontc/cparser.mly
	ocamllex c/frontc/clexer.mll
	menhir c/frontc/cparser.mly

clean:
	rm -f *~
	rm -f *.cmo
	rm -f *.cmi
	rm -f *.cmx
	rm -f *.o
	rm -f $(BINS)
	cd llvm && rm -f *~ *.cmo *.cmi *.cmx *.o
	cd c && rm -f *~ *.cmo *.cmi *.cmx *.o
	cd c/frontc && rm -f *~ *.cmo *.cmi *.cmx *.o
	cd utils && rm -f *~ *.cmo *.cmi *.cmx *.o
