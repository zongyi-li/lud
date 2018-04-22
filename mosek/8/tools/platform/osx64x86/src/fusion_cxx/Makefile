CXX=clang++ -std=c++11
LD=clang++ -std=c++11
AR=ar

CFLAGS=-O2 -fPIC
IPATHS=-I../../h -I.

libfusion64.8.1.dylib: fusion.os BaseModel.os Debug.os mosektask.os IntMap.os SolverInfo.os StringBuffer.os
	$(LD) -shared -L../../bin -o libfusion64.8.1.dylib fusion.os BaseModel.os Debug.os mosektask.os  IntMap.os SolverInfo.os StringBuffer.os -lmosek64
	install_name_tool -change libmosek64.8.1.dylib $(shell cd ../../bin; pwd)/libmosek64.8.1.dylib libfusion64.8.1.dylib

libfusion64.a: fusion.os BaseModel.os Debug.os mosektask.os IntMap.os SolverInfo.os StringBuffer.os
	$(AR) r libfusion64.a fusion.os BaseModel.os Debug.os mosektask.os IntMap.os SolverInfo.os StringBuffer.os

%.os: %.cc
	$(CXX) $(IPATHS) $(CFLAGS) -c -o $@ $<

.PHONY: clean install

install: ../../bin/libfusion64.8.1.dylib ../../bin/libfusion64.dylib

../../bin/libfusion64.8.1.dylib: libfusion64.8.1.dylib libfusion64.a
	install libfusion64.8.1.dylib ../../bin
	install libfusion64.a      ../../bin

../../bin/libfusion64.dylib: ../../bin/libfusion64.8.1.dylib
	rm -f ../../bin/libfusion64.dylib && ln -s ./libfusion64.8.1.dylib ../../bin/libfusion64.dylib

clean:
	rm -rf *.os
