objects = problem4.o
Comp = gfortran
FFLAG = -o -O2
INCLUDES = -I/usr/include -I${MKLROOT}/util/academic/intel/17.0/compilers_and_libraries/linux/mkl/include 
LIBS = -lgfortran -lblas   -Wl,--start-group libmkl_gf_ilp64.a libmkl_sequential.a libmkl_core.a -Wl,--end-group -lpthread -lm -ldl 
LFLAG = -L/usr/lib64 -L${MKLROOT}/util/academic/intel/17.0/compilers_and_libraries/linux/mkl/lib/intel64
problem4: $(objects)
	$(Comp) $(INCLUDES) -o problem4 $(objects) $(LFLAG)  $(LIBS)

%: %.o
	$(Comp) $(FFLAG) -o $@ $^ $(LFAG) $(LIBS)


%.o: %.f90
	$(Comp) -I/usr/include  $(LFLAG) -c $<

clean:
	rm *.o
