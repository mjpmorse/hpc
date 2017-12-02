#!/bin/bash
##SBATCH --partition=debug
#SBATCH --job-name='hw2q3a'
#SBATCH --output=hw2q3a.out
#SBATCH --error=hw2q3a.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=03:00:00
#SBATCH --mail-user=mjmorse3@buffalo.edu
##SBATCH --mail-type=ALL
#SBATCH --requeue

echo "SLURM_JOB_ID="$SLURM_JOB_ID
echo "SLURM_JOB_NODELIST="$SLURM_JOB_NODELIST
echo "SLURM_NNODES="$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "working directory="$SLURM_SUBMIT_DIR


module load gcc/7.2.0 
#module load openmpi/gcc-4.8.x/2.0.2
#module load intel/17.0
#module load intel-mpi/2017.0.1
#module list

srun  hw2q3a data


echo "All Done!"
