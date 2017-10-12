objects = problem4.o
Comp = ifort
FFLAG = -o -O3
LINKLINE =  -Wl,--start-group ${MKLROOT}/lib/intel64/libmkl_intel_ilp64.a
{MKLROOT}/lib/intel64/libmkl_sequential.a
{MKLROOT}/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm -ldl
INCLUDES = -I/usr/include -i8 -I${MKLROOT}/include  
LIBS = -lgfortran -lblas  -lmkl_gf_lp64 -lmkl_core -lmkl_sequential -lpthread -lm
LFLAG = -L/usr/lib64 -Wl,--no-as-needed -L${MKLROOT}/lib/intel64
problem4mkl: $(objects)
	$(Comp) $(INCLUDES) -o problem4mkl $(objects) $(LFLAG)  $(LIBS)

%: %.o
	$(Comp) $(FFLAG) -o $@ $^ $(LFAG) $(LIBS) $(LINKLINE)


%.o: %.f90
	$(Comp) $(INCLUDES)  $(LFLAG) $(LIBS)-c $<

clean:
	rm *.o
