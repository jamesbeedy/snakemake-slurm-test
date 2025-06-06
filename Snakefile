rule all:
    input:
        "results/processed_data.txt"

rule load:
    input:
        "data/raw_data_load.txt"
    output:
        "results/processed_data_loaded.txt"
    resources:
        mem_mb=500,
        threads=lambda wildcards, attempt: 2 if attempt < 2 else 4
    shell:
        "awk '{{print toupper($0)}}' {input} > {output}"

rule preprocess:
    input:
        "data/raw_data.txt"
    output:
        "results/processed_data.txt"
    resources:
        mem_mb=1000,
        threads=lambda wildcards, attempt: 2 if attempt < 2 else 4
    shell:
        "awk '{{print toupper($0)}}' {input} > {output}"
