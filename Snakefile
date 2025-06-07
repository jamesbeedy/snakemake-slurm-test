rule all:
    input:
        "results/crunch_output.txt",
        "results/preprocess_env.txt",
        "results/diagnostics_env.txt",
        "results/load_env.txt"
    message: "Executing all with {threads} threads on the following files {input}."

rule load:
    input:
        "data/raw_data.txt"
    output:
        "results/processed_data_loaded.txt",
        "results/load_env.txt"
    message: "Executing load with {threads} threads on the following files {input}."
    threads: 2
    resources:
        mem_mb=400,
        runtime=10
    shell:
        "awk '{{print toupper($0)}}' {input} > {output[0]} &&"
        "echo $SLURM_CPUS_PER_TASK; nproc; env > {output[1]}"

rule preprocess:
    input:
        "results/processed_data_loaded.txt"
    output:
        "results/preprocessed_data.txt",
        "results/preprocess_env.txt"
    message: "Executing preprocess with {threads} threads on the following files {input}."
    threads: 2
    resources:
        mem_mb=500,
        runtime=5
    shell:
        "awk '{{print tolower($0)}}' {input} > {output[0]} &&"
        "echo $SLURM_CPUS_PER_TASK; nproc; env > {output[1]}"

rule crunch:
    input:
        "results/preprocessed_data.txt"
    output:
        "results/crunch_output.txt"
    message: "Executing crunch with {threads} threads."
    threads: 2
    resources:
        mem_mb=4000,
        runtime=5
    shell:
        "srun --cpus-per-task={threads} --mem={resources.mem_mb} --time=00:10:00 awk '{{print toupper($0)}}' {input} > {output}"

rule diagnostics:
    output:
        "results/diagnostics_env.txt"
    message: "Executing diagnostics with {threads} threads."
    shell:
        "echo 'SLURM_CPUS_PER_TASK=$SLURM_CPUS_PER_TASK' > {output} && "
        "echo 'nproc=$(nproc)' >> {output} && "
        "env >> {output}"

