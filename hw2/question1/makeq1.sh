#!/bin/bash

module load openmpi/gcc-4.8.x/2.0.2

mpifort -c ../errormod.f90
mpifort problem1.f90 ../errormod.o -o $HOME/mybin/ppi.mpi
