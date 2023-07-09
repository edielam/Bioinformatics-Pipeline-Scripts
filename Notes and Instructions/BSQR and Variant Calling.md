# bqsr_and_variant-calling.sh

This script performs Base Quality Score Recalibration (BQSR) and variant calling using GATK4.

## Usage

```bash
bash bqsr_and_variant-calling.sh
```

## Prerequisites

Before running this script, make sure you have the following software and files:

- GATK4: Genome Analysis Toolkit for variant calling and analysis.
- `reference.fasta`: The reference genome in FASTA format.
- `output_directory/marked_duplicates.bam`: The BAM file with marked duplicates obtained from the previous steps.
- `known_sites.vcf`: Known variant sites in VCF format.

**Note:** Make sure to complete the previous steps and have the required input files before running this script.

## Configuration

Before running the script, update the following variables in the script:

- `reference`: Path to the reference genome FASTA file.
- `input_bam`: Path to the input BAM file with marked duplicates.
- `output_dir`: Path to the output directory where the results will be stored.
- `gatk_path`: Path to the GATK executable.
- `known_sites_vcf`: Path to the known variant sites in VCF format.

Make sure to set these variables according to your specific installation paths and file locations.

## Output

The script will generate the following output files in the specified `output_dir`:

- `recal_data.table`: Recalibration data table obtained from BaseRecalibrator.
- `recalibrated.bam`: BAM file after Base Quality Score Recalibration.
- `output.vcf`: Variant Calling Format (VCF) file containing the called variants.

## Additional Steps

You can include additional steps for variant filtering and annotation after variant calling by modifying the script accordingly. Refer to the GATK4 documentation or other tools for further analysis and annotation of the VCF file.
