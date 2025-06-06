#!/bin/bash
#SBATCH --job-name=smk.{rule}
#SBATCH --output=logs/{rule}.{wildcards}.out
#SBATCH --error=logs/{rule}.{wildcards}.err
#SBATCH --mem={resources.mem_mb}
#SBATCH --cpus-per-task={threads}

# Load environment if needed
source ~/.bashrc
source /jupyterhub-nfs/venv/bin/activate
# conda activate snakemake-env

{exec_job}
