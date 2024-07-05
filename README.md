# Genome Analysis Pipeline

This repository contains scripts and tools for analyzing whole genome sequencing data using GATK4. The pipeline includes several steps, such as quality control analysis, alignment, variant calling, variant filtering, and functional analysis.

## Table of Contents

- [Getting Started](#getting-started)
- [Dependencies](#dependencies)
- [Usage](#usage)
- [Scripts](#scripts)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

To get started with the genome analysis pipeline, follow these instructions:

1. Clone this repository: git clone https://github.com/edielam/Genome-Analysis-Pipeline.git


2. Install the required dependencies (see the [Dependencies](#dependencies) section for details).

3. Prepare your input data, including raw sequencing reads, reference genome, and known variant sites.

4. Customize the pipeline by updating the configuration files and script parameters according to your analysis requirements.

5. Execute the pipeline by running the provided scripts in the specified order.

## Dependencies

The following dependencies are required to run the genome analysis pipeline:

- GATK4
- FastQC
- BWA
- Samtools
- Picard
- VCFtools
- Variant Effect Predictor (VEP)
- Python (with pandas, matplotlib, and other required libraries)

Ensure that these dependencies are installed and accessible in your environment before running the pipeline.

## Usage

The pipeline is divided into several steps, each implemented in a separate script. Follow the instructions in each script to perform the specific analysis step.

1. QC Analysis, Alignment, and Mark Duplicates: Run `qc-analysis_alignment_and_markduplicates.sh` to perform quality control analysis, read alignment, and duplicate marking in a single step.

2. BQSR and Variant Calling: Execute `bqsr_and_variant-calling.sh` to perform Base Quality Score Recalibration (BQSR) and variant calling using GATK4's HaplotypeCaller.

3. Variant Filtering and Annotation: Use `variant-filtering-and_annotation.sh` to filter variant calls based on quality, coverage, and other criteria, and annotate the variants using Variant Effect Predictor (VEP).

4. Functional Analysis: Utilize `functional_analysis.py` to perform functional analysis, including gene prioritization and pathway enrichment. Use `protein_sequence_generation.py` for protein sequence generation.

5. Visualization: Use `visualization_of_variants.py` for generating visuals to be included in your report.

Refer to the individual scripts and their respective README files for detailed instructions on usage, inputs, and outputs.

## Scripts

- `qc-analysis_alignment_and_markduplicates.sh`: Script for performing quality control analysis, alignment, and marking duplicates.
- `bqsr_and_variant-calling.sh`: Script for performing Base Quality Score Recalibration (BQSR) and variant calling.
- `variant-filtering-and_annotation.sh`: Script for filtering variant calls based on quality, coverage, and other criteria, and annotating variants using VEP.
- `functional_analysis.py`: Python script for performing functional analysis, including gene prioritization, pathway enrichment, visualization of variants, and protein sequence generation.
- `visualization_of_variants.py`: Python script for generating visualizations of variants, such as bar charts and network plots, using annotated variant data.
- `protein_sequence_generation.py`: Python script for generating protein sequences incorporating gene variants using Biopython.

## Contributing

Contributions are welcome! If you have suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License]
