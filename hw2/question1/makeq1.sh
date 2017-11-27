#!/bin/bash

module load openmpi/gcc-4.8.x/2.0.2

mpifort problem1.f90 ../errorcheck.f90 -o $HOME/mybin/ppi.mpi
