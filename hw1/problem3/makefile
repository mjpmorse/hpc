objects = problem3.o
Comp = ifort
FFLAG = -O2
INCLUDES = -I/usr/include
LIBS = -lgfortran
FFLAG = -L/usr/lib
problem3: $(objects)
	gfortran $(INCLUDES) -o problem3 $(objects) $(LFLAGS)  $(LIBS)

problem3intel: $(objects)
	ifort $(INCLUDES) -o problem3intel $(objects) $(LFLAGS) $(LIBS)

%: %.o
	$(Comp) $(FFLAG) -o $@ $^ $(LIBS)


%.o: %.f
	$(Comp) -I/usr/include $(FFLAG) -c $<

clean:
	rm *.o
