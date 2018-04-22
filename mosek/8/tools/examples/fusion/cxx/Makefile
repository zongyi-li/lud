
#
# Compile and run MOSEK examples
#

CC=clang++
IPATHS=-I../../../platform/osx64x86/h -I../../../platform/osx64x86/include
LPATHS=-L../../../platform/osx64x86/bin

fusion: 
	make install -C ../../../platform/osx64x86/src/fusion_cxx

TrafficNetworkModel: fusion TrafficNetworkModel.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o TrafficNetworkModel TrafficNetworkModel.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib TrafficNetworkModel || rm -f TrafficNetworkModel
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib TrafficNetworkModel || rm -f TrafficNetworkModel

alan: fusion alan.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o alan alan.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib alan || rm -f alan
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib alan || rm -f alan

baker: fusion baker.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o baker baker.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib baker || rm -f baker
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib baker || rm -f baker

breaksolver: fusion breaksolver.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o breaksolver breaksolver.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib breaksolver || rm -f breaksolver
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib breaksolver || rm -f breaksolver

callback: fusion callback.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o callback callback.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib callback || rm -f callback
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib callback || rm -f callback

cqo1: fusion cqo1.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o cqo1 cqo1.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib cqo1 || rm -f cqo1
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib cqo1 || rm -f cqo1

diet: fusion diet.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o diet diet.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib diet || rm -f diet
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib diet || rm -f diet

duality: fusion duality.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o duality duality.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib duality || rm -f duality
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib duality || rm -f duality

facility_location: fusion facility_location.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o facility_location facility_location.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib facility_location || rm -f facility_location
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib facility_location || rm -f facility_location

lo1: fusion lo1.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o lo1 lo1.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib lo1 || rm -f lo1
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib lo1 || rm -f lo1

lownerjohn_ellipsoid: fusion lownerjohn_ellipsoid.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o lownerjohn_ellipsoid lownerjohn_ellipsoid.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib lownerjohn_ellipsoid || rm -f lownerjohn_ellipsoid
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib lownerjohn_ellipsoid || rm -f lownerjohn_ellipsoid

lpt: fusion lpt.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o lpt lpt.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib lpt || rm -f lpt
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib lpt || rm -f lpt

milo1: fusion milo1.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o milo1 milo1.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib milo1 || rm -f milo1
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib milo1 || rm -f milo1

mioinitsol: fusion mioinitsol.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o mioinitsol mioinitsol.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib mioinitsol || rm -f mioinitsol
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib mioinitsol || rm -f mioinitsol

nearestcorr: fusion nearestcorr.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o nearestcorr nearestcorr.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib nearestcorr || rm -f nearestcorr
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib nearestcorr || rm -f nearestcorr

parameters: fusion parameters.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o parameters parameters.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib parameters || rm -f parameters
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib parameters || rm -f parameters

portfolio: fusion portfolio.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o portfolio portfolio.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib portfolio || rm -f portfolio
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib portfolio || rm -f portfolio

primal_svm: fusion primal_svm.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o primal_svm primal_svm.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib primal_svm || rm -f primal_svm
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib primal_svm || rm -f primal_svm

production: fusion production.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o production production.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib production || rm -f production
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib production || rm -f production

qcqp_sdo_relaxation: fusion qcqp_sdo_relaxation.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o qcqp_sdo_relaxation qcqp_sdo_relaxation.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib qcqp_sdo_relaxation || rm -f qcqp_sdo_relaxation
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib qcqp_sdo_relaxation || rm -f qcqp_sdo_relaxation

sdo1: fusion sdo1.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o sdo1 sdo1.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib sdo1 || rm -f sdo1
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib sdo1 || rm -f sdo1

sospoly: fusion sospoly.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o sospoly sospoly.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib sospoly || rm -f sospoly
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib sospoly || rm -f sospoly

sudoku: fusion sudoku.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o sudoku sudoku.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib sudoku || rm -f sudoku
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib sudoku || rm -f sudoku

total_variation: fusion total_variation.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o total_variation total_variation.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib total_variation || rm -f total_variation
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib total_variation || rm -f total_variation

tsp: fusion tsp.cc
	$(CC) -Wl,-headerpad_max_install_names -std=c++11 -stdlib=libc++ -g $(IPATHS) $(LPATHS) -o tsp tsp.cc -lfusion64 -lmosek64
	install_name_tool -change libfusion64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libfusion64.8.1.dylib tsp || rm -f tsp
	install_name_tool -change libmosek64.8.1.dylib `pwd`/../../../platform/osx64x86/bin/libmosek64.8.1.dylib tsp || rm -f tsp

all: TrafficNetworkModel alan baker breaksolver callback cqo1 diet duality facility_location lo1 lownerjohn_ellipsoid lpt milo1 mioinitsol nearestcorr parameters portfolio primal_svm production qcqp_sdo_relaxation sdo1 sospoly sudoku total_variation tsp

clean:
	make clean -C ../../../platform/osx64x86/src/fusion_cxx	rm -f TrafficNetworkModel alan baker breaksolver callback cqo1 diet duality facility_location lo1 lownerjohn_ellipsoid lpt milo1 mioinitsol nearestcorr parameters portfolio primal_svm production qcqp_sdo_relaxation sdo1 sospoly sudoku total_variation tsp

test: TrafficNetworkModel alan baker breaksolver callback cqo1 diet duality facility_location lo1 lownerjohn_ellipsoid lpt milo1 mioinitsol nearestcorr parameters portfolio primal_svm production qcqp_sdo_relaxation sdo1 sospoly sudoku total_variation tsp
	./TrafficNetworkModel
	./alan
	./baker
	./breaksolver
	./callback
	./cqo1
	./diet
	./duality
	./facility_location
	./lo1
	./lownerjohn_ellipsoid
	./lpt
	./milo1
	./mioinitsol
	./nearestcorr
	./parameters
	./portfolio
	./primal_svm
	./production
	./qcqp_sdo_relaxation
	./sdo1
	./sospoly
	./sudoku
	./total_variation
	./tsp
