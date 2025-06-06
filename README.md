# Snakemake + Slurm Example

### Init project
```bash
git clone https://github.com/jamesbeedy/snakemake-slurm-test.git

cd snakemake-slurm-test/

python3 -m venv venv
source venv/bin/activate

pip install snakemake-executor-plugin-slurm snakemake
```

### Execute snakemake
```bash
snakemake --profile slurm
```
