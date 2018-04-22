#
# Compile and run MOSEK examples
#

CC=clang
IPATHS=-I../../platform/osx64x86/h
LPATH=-L../../platform/osx64x86/bin -Wl,-headerpad,128
LIBS=-lmosek64


%.o: %.c
	$(CC) -c -g $(IPATHS) -o $@ $<

blas_lapack: blas_lapack.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
callback: callback.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
case_portfolio_1: case_portfolio_1.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
case_portfolio_2: case_portfolio_2.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
case_portfolio_3: case_portfolio_3.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
cqo1: cqo1.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
errorreporting: errorreporting.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
feasrepairex1: feasrepairex1.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
lo1: lo1.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
lo2: lo2.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
milo1: milo1.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
mioinitsol: mioinitsol.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
opt_server_async: opt_server_async.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
opt_server_sync: opt_server_sync.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
parameters: parameters.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
production: production.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
qcqo1: qcqo1.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
qo1: qo1.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
response: response.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
sdo1: sdo1.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
sensitivity: sensitivity.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
simple: simple.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
solutionquality: solutionquality.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
solvebasis: solvebasis.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
solvelinear: solvelinear.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
sparsecholesky: sparsecholesky.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
unicode: unicode.o
	$(CC) -g $(LPATH) -o $@ $< $(LIBS)
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
tstscopt: tstscopt.o scopt-ext.o
	$(CC) -g $(LPATH) -o $@ $^ $(LIBS) -lm
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@
tstexpopt: tstexpopt.o scopt-ext.o expopt.o dgopt.o
	$(CC) -g $(LPATH) -o $@ $^ $(LIBS) -lm
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../platform/osx64x86/bin/libmosek64.8.1.dylib $@

.PHONY: clean test all

all: blas_lapack callback case_portfolio_1 case_portfolio_2 case_portfolio_3 cqo1 errorreporting feasrepairex1 lo1 lo2 milo1 mioinitsol opt_server_async opt_server_sync parameters production qcqo1 qo1 response sdo1 sensitivity simple solutionquality solvebasis solvelinear sparsecholesky unicode tstscopt tstexpopt

.DEFAULT: all

clean:
	rm -f blas_lapack callback case_portfolio_1 case_portfolio_2 case_portfolio_3 cqo1 errorreporting feasrepairex1 lo1 lo2 milo1 mioinitsol opt_server_async opt_server_sync parameters production qcqo1 qo1 response sdo1 sensitivity simple solutionquality solvebasis solvelinear sparsecholesky unicode tstexpopt tstscopt
	rm -f blas_lapack.o callback.o case_portfolio_1.o case_portfolio_2.o case_portfolio_3.o cqo1.o errorreporting.o feasrepairex1.o lo1.o lo2.o milo1.o mioinitsol.o opt_server_async.o opt_server_sync.o parameters.o production.o qcqo1.o qo1.o response.o sdo1.o sensitivity.o simple.o solutionquality.o solvebasis.o solvelinear.o sparsecholesky.o unicode.o tstscopt.o tstexpopt.o scopt-ext.o dgopt.o expopt.o

test: blas_lapack callback case_portfolio_1 case_portfolio_2 case_portfolio_3 cqo1 errorreporting feasrepairex1 lo1 lo2 milo1 mioinitsol opt_server_async opt_server_sync parameters production qcqo1 qo1 response sdo1 sensitivity simple solutionquality solvebasis solvelinear sparsecholesky unicode tstscopt tstexpopt
	./blas_lapack
	./callback
	./case_portfolio_1
	./case_portfolio_2
	./case_portfolio_3
	./cqo1
	./errorreporting
	./feasrepairex1
	./lo1
	./lo2
	./milo1
	./mioinitsol
	./opt_server_async
	./opt_server_sync
	./parameters
	./production
	./qcqo1
	./qo1
	./response
	./sdo1
	./sensitivity
	./simple
	./solutionquality
	./solvebasis
	./solvelinear
	./sparsecholesky
	./unicode
	./tstexpopt
	./tstscopt
