objects = problem3.o
Comp = gfortran
FFLAG = -O3
INCLUDES = -I/usr/include
LIBS = -lgfortran
FFLAG = -L/usr/lib
problem3g: $(objects)
	$(Comp) $(INCLUDES) -o problem3g $(objects) $(LFLAGS)  $(LIBS)

%: %.o
	$(Comp) $(FFLAG) -o $@ $^ $(LIBS)


%.o: %.f
	$(Comp) -I/usr/include $(FFLAG) -c $<

clean:
	rm *.o
