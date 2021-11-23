#!/bin/bash
#SBATCH --clusters=amarel            # Select which system(s) to use
#SBATCH --partition=main             # Partition (job queue)
#SBATCH --requeue                    # Return job to the queue if preempted
#SBATCH --job-name=<name>             # Assign an short name to your job
#SBATCH --nodes=1                    # Number of nodes you require
#SBATCH --ntasks=32                 # Total # of tasks across all nodes
#SBATCH --cpus-per-task=1            # Cores per task (>1 if multithread tasks)
#SBATCH --mem=16G                     # Real memory (RAM) required per node
#SBATCH --time=01:00:00                 # Total run time limit (DD-HH:MM:SS)
#SBATCH --output=slurm.%N.%j.out     # STDOUT file for SLURM output

cd $PWD

## Environment settings needed for this job
module load intel/17.0.1  mvapich2/2.2  cuda/7.5
module load amber/16

## Run the job
sander.MPI -O -i min.mdin -p 2lko.parm7 -c 2lko.rst7 -o a_min.out -r a_min.rst7 -x a_min.nc -ref 2lko.rst7 -cpin 2lko.cpin


