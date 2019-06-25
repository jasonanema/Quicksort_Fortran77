# Makefile for testing_quicksort_real_F77.F
# June 2019, Jason Allen Anema, Ph.D.
FC:=gfortran

FILES =         compreal.o \
                quicksort_real_F77.o \
                testing_quicksort_real_F77.o

testing_quicksort_real_F77: $(FILES)
	gfortran *.o -o $@
