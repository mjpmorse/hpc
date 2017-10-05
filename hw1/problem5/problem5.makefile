objects = problem5.o
Comp = gfortran
FFLAG = -o -O2
INCLUDES = -I/usr/include  
LIBS = -lgfortran -lblas
LFLAG = -L/usr/lib64 
problem5: $(objects)
	$(Comp) $(INCLUDES) -o problem5 $(objects) $(LFLAG)  $(LIBS)

%: %.o
	$(Comp) $(FFLAG) -o $@ $^ $(LFAG) $(LIBS)


%.o: %.f90
	$(Comp) $(INCLUDES)  $(LFLAG) -c $<

clean:
	rm *.o
