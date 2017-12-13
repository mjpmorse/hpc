#!/bin/bash
##SBATCH --partition=largemem
#SBATCH --partition=debug
#SBATCH --job-name='hw3q1'
#SBATCH --output=hw3.out
#SBATCH --error=hw3.err
#SBATCH --constraint=IB
#SBATCH --nodes=2
#SBATCH --account=hpc1f17
#SBATCH --ntasks-per-node=12
#SBATCH --time=00:20:00
#SBATCH --mail-user=mjmorse3@buffalo.edu
##SBATCH --mail-type=ALL
#SBATCH --requeue

echo "SLURM_JOB_ID="$SLURM_JOB_ID
echo "SLURM_JOB_NODELIST="$SLURM_JOB_NODELIST
echo "SLURM_NNODES="$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "working directory="$SLURM_SUBMIT_DIR


module load gcc/7.2.0 
module load openmpi/gcc-4.8.x/2.0.2
module list

for i in $(seq 2 2 $SLURM_NPROCS);
do
srun --mpi=pmi2 -n $i hw3q1.mpi $i
done


echo "All Done!"