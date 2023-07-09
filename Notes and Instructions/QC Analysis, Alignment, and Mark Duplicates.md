# qc-analysis_alignment_and_markduplicates.sh

This script performs quality control analysis, read alignment, and marking duplicates on raw sequencing data using various software tools.

## Usage

```bash
bash qc-analysis_alignment_and_markduplicates.sh
```

## Prerequisites

Before running this script, make sure you have the following software and files:

- FastQC: Quality control tool for sequencing data.
- Trimmomatic: Tool for trimming adapter sequences and low-quality bases.
- BWA: Burrows-Wheeler Aligner for read alignment.
- Samtools: Utilities for manipulating SAM/BAM files.
- Picard: Tools for manipulating and analyzing sequencing data.

Also, ensure you have the following files:

- `raw_fastq.gz`: The raw FASTQ file containing the sequencing reads.
- `reference.fasta`: The reference genome in FASTA format.
- `adapters.fa`: The file containing adapter sequences for trimming.

## Configuration

Before running the script, update the following variables in the script:

- `raw_fastq`: Path to the raw FASTQ file.
- `reference`: Path to the reference genome FASTA file.
- `output_dir`: Path to the output directory where the results will be stored.
- `fastqc_path`: Path to the FastQC executable.
- `trimmomatic_path`: Path to the Trimmomatic JAR file.
- `bwa_path`: Path to the BWA executable.
- `samtools_path`: Path to the Samtools executable.
- `picard_path`: Path to the Picard JAR file.

Make sure to set these variables according to your specific installation paths.

## Output

The script will generate the following output files in the specified `output_dir`:

- `fastqc`: Folder containing FastQC reports for the raw FASTQ file.
- `trimmed.fastq.gz`: Trimmed FASTQ file after adapter trimming and quality filtering.
- `aligned.sam`: SAM file containing aligned reads.
- `aligned.bam`: BAM file converted from the aligned SAM file.
- `sorted.bam`: Sorted BAM file.
- `marked_duplicates.bam`: BAM file with duplicate reads marked.
- `marked_duplicates_metrics.txt`: Metrics file containing information about duplicate reads.
