#!/bin/bash

#module load openmpi/gcc-4.8.x/2.0.2
module load intel-mpi/2017.0.1
module load intel/17.0
module list
#mpifort -c ../errormod.f90
mpiifort -O2  source/question3b.f90 source/mandelbrot.f90 ../errormod.f90 -o $HOME/mybin/hw2q3b.mpi
