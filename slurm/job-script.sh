#!/bin/bash
#SBATCH --job-name=smk.{rule}
#SBATCH --output=logs/{rule}.{wildcards}.out
#SBATCH --error=logs/{rule}.{wildcards}.err
#SBATCH --mem={resources.mem_mb}
#SBATCH --cpus-per-task={threads}

{exec_job}
