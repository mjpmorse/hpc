#!/bin/bash

#module load openmpi/gcc-4.8.x/2.0.2
module load intel-mpi/2017.0.1 
module load intel/17.0
module list
#mpifort -c ../errormod.f90
mpiifort problem1.f90 ../errormod.f90 -o $HOME/mybin/hw2q1.mpi
