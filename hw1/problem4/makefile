objects = problem4.o
Comp = gfortran
FFLAG = -O2
INCLUDES = -I/usr/include
LIBS = -lgfortran -llibblas
LFLAG = -L/lib64
problem4: $(objects)
	$(Comp) $(INCLUDES) -o problem4 $(objects) $(LFLAG)  $(LIBS)

%: %.o
	$(Comp) $(FFLAG) -o $@ $^ $(LFAG) $(LIBS)


%.o: %.f
	$(Comp) -I/usr/include -I/usr/lib64 $(LFLAG) -c $<

clean:
	rm *.o
