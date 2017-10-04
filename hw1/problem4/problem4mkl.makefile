objects = problem4.o
Comp = gfortran
FFLAG = -O2 -fdefault-integer-8 -m64
INCLUDES = -I/usr/include 
LIBS = -lgfortran -lblas 
LFLAG = -L/usr/lib64
problem4mkl: $(objects)
	$(Comp) $(INCLUDES) -o problem4mkl $(objects) $(LFLAG)  $(LIBS)

%: %.o
	$(Comp) $(FFLAG) -o $@ $^ $(LFAG) $(LIBS)


%.o: %.f90
	$(Comp) -I/usr/include  $(LFLAG) -c $<

clean:
	rm *.o problem4mkl
