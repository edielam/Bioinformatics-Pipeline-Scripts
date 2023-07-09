#!/bin/bash

# Set input file paths
reference="/path/to/reference.fasta"
input_vcf="/path/to/output_directory/output.vcf"
output_dir="/path/to/output_directory"

# Set software paths (update these according to your installation)
gatk_path="/path/to/gatk-4.XX.X.X/gatk"
bcftools_path="/path/to/bcftools"
vep_path="/path/to/vep"

# Create output directory
mkdir -p "${output_dir}"

# Step 6: Variant Filtering
filtered_vcf="${output_dir}/filtered.vcf"

${gatk_path} VariantFiltration \
  -R "${reference}" \
  -V "${input_vcf}" \
  --filter-expression "QUAL < 30.0" \ 
  --filter-name "LowQual" \
  -O "${filtered_vcf}"
#you could also filter with more constraints: --filter-expression "QUAL < 30.0 || INFO/GENE_NAME == 'CLP1' || INFO/CLIN_SIG =~ 'pathogenic' || INFO/DB = 'OMIM'" \
# Step 7: Variant Annotation and Post-processing
normalized_vcf="${output_dir}/normalized.vcf"
annotated_vcf="${output_dir}/annotated.vcf"
compressed_vcf="${output_dir}/compressed.vcf"

# Normalize the VCF
${bcftools_path} norm -m -any "${filtered_vcf}" -Ou | ${bcftools_path} norm -f "${reference}" -Ou | ${bcftools_path} norm -d all -Ov > "${normalized_vcf}"

# Annotate the VCF using VEP (Variant Effect Predictor)
${vep_path} --cache --dir_cache /path/to/vep_cache --assembly GRCh38 --offline --no_stats --fasta "${reference}" --vcf --input_file "${normalized_vcf}" --output_file "${annotated_vcf}"

# Compress and index the annotated VCF
${bcftools_path} view "${annotated_vcf}" -Oz -o "${compressed_vcf}"
${bcftools_path} index "${compressed_vcf}"


# Convert VCF to CSV using bcftools
# Convert VCF to CSV using bcftools
output_csv="${output_dir}/annotated_variants.csv"

bcftools query -f '%CHROM\t%POS\t%REF\t%ALT\t%INFO/GENE\t%INFO/VARIANT_TYPE\t%INFO/CONSEQUENCE\t%INFO/CLINICAL_SIGNIFICANCE\n' "${annotated_vcf}" > "${output_csv}"
