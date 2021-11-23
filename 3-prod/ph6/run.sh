#!/bin/bash
#SBATCH --clusters=amarel            # Select which system(s) to use
#SBATCH --partition=main             # Partition (job queue)
#SBATCH --requeue                    # Return job to the queue if preempted
#SBATCH --job-name=3PH6             # Assign an short name to your job
#SBATCH --nodes=1                    # Number of nodes you require
#SBATCH --ntasks=30                 # Total # of tasks across all nodes
#SBATCH --cpus-per-task=1            # Cores per task (>1 if multithread tasks)
#SBATCH --mem-per-cpu=3000          # mem requested per CPU in MB
#SBATCH --time=72:00:00                 # Total run time limit (DD-HH:MM:SS)
#SBATCH --output=slurm.%N.%j.out     # STDOUT file for SLURM output

cd $PWD

## Environment settings needed for this job
module load intel/17.0.1  mvapich2/2.2  cuda/7.5
module load amber/16

srun --mpi=pmi2 sander.MPI -O -i md.mdin -p 2lko.parm7 -c 2lko.equil.rst7 -cpin 2lko.equil.cpin -o 2lko.production_pH_6.mdout -cpout 2lko.production_pH_6.cpout -r 2lko.production_pH_6.rst7 -x 2lko.production_pH_6.nc -cprestrt 2lko.production_pH_6.cpin ## Run the job

