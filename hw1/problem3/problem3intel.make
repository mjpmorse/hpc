objects = problem3.o
Comp = ifort
FFLAG = -O3
INCLUDES = -I/usr/include
LIBS = 
FFLAG = -L/usr/lib
problem3intel: $(objects)
	$(Comp) $(INCLUDES) -o problem3intel $(objects) $(LFLAGS)  $(LIBS)

%: %.o
	$(Comp) $(FFLAG) -o $@ $^ $(LIBS)


%.o: %.f90
	$(Comp) $(INCLUDES) $(FFLAG) -c $<

clean:
	rm *.o
