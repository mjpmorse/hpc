objects = problem5.o
Comp = ifort
FFLAG = -O3
INCLUDES = -I/usr/include -i8  -I${MKLROOT}/include  
LIBS = -lgfortran -lblas -lmkl_intel_ilp64 -lmkl_sequential -lmkl_core -lpthread -lm -ldl 
LFLAG = -L/usr/lib64 -Wl,--no-as-needed -L${MKLROOT}/lib/intel64 
problem5mklintel: $(objects)
	$(Comp) $(INCLUDES) -o problem5mklintel $(objects) $(LFLAG)  $(LIBS)

%: %.o
	$(Comp) $(FFLAG) -o $@ $^ $(LFAG) $(LIBS)


%.o: %.f90
	$(Comp) $(INCLUDES)  $(LFLAG) -c $<

clean:
	rm *.o
