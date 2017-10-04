objects = problem4.o
Comp = gfortran
FFLAG = -o -O2
INCLUDES = -I/usr/include -m64 -I${MKLROOT}/include 
LIBS = -lgfortran -lblas  -lmkl_gf_lp64 -lmkl_core -lmkl_sequential -lpthread -lm 
LFLAG = -L/usr/lib64 -Wl,--no-as-needed -L${MKLROOT}/lib/intel64
problem4: $(objects)
	$(Comp) $(INCLUDES) -o problem4 $(objects) $(LFLAG)  $(LIBS)

%: %.o
	$(Comp) $(FFLAG) -o $@ $^ $(LFAG) $(LIBS)


%.o: %.f90
	$(Comp) -I/usr/include  $(LFLAG) -c $<

clean:
	rm *.o
