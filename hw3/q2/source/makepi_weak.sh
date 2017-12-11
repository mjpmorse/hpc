#!/bin/bash

module load openmpi/gcc-4.8.x/2.0.2

mpifort pi_weak.f90 -o $HOME/mybin/ppi_weak.mpi
