objects = problem4.o
Comp = mpifort
FFLAG = -O2
INCLUDES = -I/usr/include 
LIBS = -lgfortran -lblas -lmpi
LFLAG = -L/usr/lib64
problem4: $(objects)
	$(Comp) $(INCLUDES) -o problem4 $(objects) $(LFLAG)  $(LIBS)

%: %.o
	$(Comp) $(FFLAG) -o $@ $^ $(LFAG) $(LIBS)


%.o: %.f90
	$(Comp) -I/usr/include  $(LFLAG) -c $<

clean:
	rm *.o
