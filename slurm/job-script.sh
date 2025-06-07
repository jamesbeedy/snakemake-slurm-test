#!/bin/bash
#SBATCH --job-name=smk.{rule}
#SBATCH --time={resources.runtime}:00
#SBATCH --output=logs/{rule}.{wildcards}.out
#SBATCH --error=logs/{rule}.{wildcards}.err
#SBATCH --mem-per-cpu={resources.mem_mb}
#SBATCH --cpus-per-task={threads}

{exec_job}
