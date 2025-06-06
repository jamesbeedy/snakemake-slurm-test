rule all:
    input:
        "results/processed_data.txt"

rule load:
    input:
        "data/raw_data.txt"
    output:
        "results/processed_data_loaded.txt"
    resources:
        mem_mb=400,
        threads=4
    shell:
        "awk '{{print toupper($0)}}' {input} > {output}"

rule preprocess:
    input:
        "results/processed_data_loaded.txt"
    output:
        "results/processed_data.txt"
    resources:
        mem_mb=600,
        threads=4
    shell:
        "awk '{{print tolower($0)}}' {input} > {output}"
