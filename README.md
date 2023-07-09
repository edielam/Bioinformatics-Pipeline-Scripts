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

1. QC Analysis: Run `qc_analysis.sh` to perform quality control analysis on raw sequence data.

2. Alignment and Mark Duplicates: Execute `alignment_and_markduplicates.sh` to align reads, perform sorting, and mark duplicates.

3. BQSR: Run `bqsr.sh` to perform Base Quality Score Recalibration (BQSR) on aligned BAM files.

4. Variant Calling: Execute `variant_calling.sh` to perform variant calling using GATK4's HaplotypeCaller.

5. Variant Filtering: Use `variant_filtering.sh` to filter variant calls based on quality, coverage, and other criteria.

6. Variant Annotation: Run `variant_annotation.sh` to annotate variants using Variant Effect Predictor (VEP) and generate VEP output.

7. Functional Analysis: Utilize `functional_analysis.py` to perform functional analysis, including gene prioritization, pathway enrichment, and protein structure analysis.

Refer to the individual scripts and their respective README files for detailed instructions on usage, inputs, and outputs.

## Scripts

- `qc_analysis.sh`: Script for performing quality control analysis on raw sequence data.
- `alignment_and_markduplicates.sh`: Script for aligning reads, performing sorting, and marking duplicates.
- `bqsr.sh`: Script for performing Base Quality Score Recalibration (BQSR) on aligned BAM files.
- `variant_calling.sh`: Script for variant calling using GATK4's HaplotypeCaller.
- `variant_filtering.sh`: Script for filtering variant calls based on quality, coverage, and other criteria.
- `variant_annotation.sh`: Script for annotating variants using Variant Effect Predictor (VEP) and generating VEP output.
- `functional_analysis.py`: Python script for performing functional analysis, including gene prioritization, pathway enrichment, and protein structure analysis.

## Contributing

Contributions are welcome! If you have suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
