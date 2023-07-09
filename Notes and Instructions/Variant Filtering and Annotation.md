# variant-filtering-and_annotation.sh

This script performs variant filtering and annotation using GATK4, BCFtools, and VEP.

## Usage

```bash
bash variant-filtering-and_annotation.sh
```

## Prerequisites

Before running this script, make sure you have the following software and files:

- GATK4: Genome Analysis Toolkit for variant filtering.
- BCFtools: Utilities for manipulating VCF/BCF files.
- VEP (Variant Effect Predictor): Tool for variant annotation.
- `reference.fasta`: The reference genome in FASTA format.
- `output_directory/output.vcf`: The VCF file obtained from the previous steps.

**Note:** Make sure to complete the previous steps and have the required input files before running this script.

## Configuration

Before running the script, update the following variables in the script:

- `reference`: Path to the reference genome FASTA file.
- `input_vcf`: Path to the input VCF file.
- `output_dir`: Path to the output directory where the results will be stored.
- `gatk_path`: Path to the GATK executable.
- `bcftools_path`: Path to the BCFtools executable.
- `vep_path`: Path to the VEP executable.
- `vep_cache`: Path to the VEP cache directory.

Make sure to set these variables according to your specific installation paths and file locations.

## Output

The script will generate the following output files in the specified `output_dir`:

- `filtered.vcf`: VCF file containing the filtered variants.
- `normalized.vcf`: VCF file containing the normalized variants.
- `annotated.vcf`: VCF file containing the annotated variants.
- `compressed.vcf`: Compressed VCF file.
- `annotated_variants.csv`: CSV file containing the annotated variants in tabular format.
