#!/bin/bash
#SBATCH --partition=debug
#SBATCH --job-name='phello'
#SBATCH --output=phello-%j.out
#SBATCH --error=phello-%j.err
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


module load intel/17.0
module load intel-mpi/2017.0.1
module list



export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so
srun ./helloworld

echo "All Done!"
