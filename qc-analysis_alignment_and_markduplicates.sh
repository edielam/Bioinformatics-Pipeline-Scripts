#!/bin/bash

# Set input file paths
raw_fastq="/path/to/raw.fastq.gz"
reference="/path/to/reference.fasta"
output_dir="/path/to/output_directory"

# Set software paths (update these according to your installation)
fastqc_path="/path/to/fastqc"
trimmomatic_path="/path/to/trimmomatic.jar"
bwa_path="/path/to/bwa"
samtools_path="/path/to/samtools"
picard_path="/path/to/picard.jar"

# Create output directory
mkdir -p "${output_dir}"

# Step 1: Quality Control (QC)
${fastqc_path} "${raw_fastq}" --outdir "${output_dir}/fastqc"

# Step 2: Trimming
trimmed_fastq="${output_dir}/trimmed.fastq.gz"

java -jar "${trimmomatic_path}" SE -phred33 "${raw_fastq}" "${trimmed_fastq}" \
    ILLUMINACLIP:/path/to/adapters.fa:2:30:10 \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

# Step 3: Read Alignment and Marking Duplicates
aligned_sam="${output_dir}/aligned.sam"
aligned_bam="${output_dir}/aligned.bam"
sorted_bam="${output_dir}/sorted.bam"
marked_duplicates_bam="${output_dir}/marked_duplicates.bam"
marked_duplicates_metrics="${output_dir}/marked_duplicates_metrics.txt"

${bwa_path} mem -t 4 -M "${reference}" "${trimmed_fastq}" > "${aligned_sam}"

${samtools_path} view -@ 4 -bS "${aligned_sam}" > "${aligned_bam}"

${samtools_path} sort -@ 4 -o "${sorted_bam}" "${aligned_bam}"

java -jar "${picard_path}" MarkDuplicates \
    INPUT="${sorted_bam}" \
    OUTPUT="${marked_duplicates_bam}" \
    METRICS_FILE="${marked_duplicates_metrics}"

${samtools_path} index "${marked_duplicates_bam}"
