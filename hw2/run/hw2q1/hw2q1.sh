#!/bin/bash
#SBATCH --partition=debug
#SBATCH --job-name='hw2q1'
#SBATCH --output=hw2q1-%j.out
#SBATCH --error=hw2q1o-%j.err
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=12
#SBATCH --time=00:05:00
#SBATCH --mail-user=mjmorse3@buffalo.edu
#SBATCH --mail-type=ALL
#SBATCH --requeue

echo "SLURM_JOB_ID="$SLURM_JOB_ID
echo "SLURM_JOB_NODELIST="$SLURM_JOB_NODELIST
echo "SLURM_NNODES="$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "working directory="$SLURM_SUBMIT_DIR


module load gcc/7.2.0 
module load openmpi/gcc-4.8.x/2.0.2
module list

srun --mpi=pmi2 -n $SLURM_NPROCS hw2q1.mpi


echo "All Done!"
