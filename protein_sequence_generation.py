from Bio import SeqIO
from Bio.Seq import Seq
from Bio.Alphabet import IUPAC

# Load the gene variant annotation data into a DataFrame (assuming it's already loaded)

# Function to generate mutated protein sequence
def generate_mutated_protein_sequence(transcript_sequence, variant_position, variant_aa):
    # Convert the transcript sequence to a Biopython Seq object
    seq = Seq(transcript_sequence, IUPAC.unambiguous_dna)
    
    # Determine the position in the DNA sequence where the variant occurs
    dna_position = (variant_position - 1) * 3
    
    # Update the DNA sequence with the variant amino acid
    mutated_seq = seq.tomutable()
    mutated_seq[dna_position:dna_position+3] = variant_aa
    
    # Translate the mutated DNA sequence to protein sequence
    mutated_protein_seq = mutated_seq.translate()
    
    return str(mutated_protein_seq)

# Iterate over the gene variants
for index, row in variant_df.iterrows():
    gene_id = row['GENE']
    variant_position = row['POSITION']
    variant_aa = row['VARIANT_AA']
    
    # Retrieve the transcript sequence for the gene
    transcript_record = SeqIO.read(f'path/to/transcript_sequences/{gene_id}.fasta', 'fasta')
    transcript_sequence = str(transcript_record.seq)
    
    # Generate the mutated protein sequence
    mutated_protein_sequence = generate_mutated_protein_sequence(transcript_sequence, variant_position, variant_aa)
    
    # Perform further analysis or store the mutated protein sequence as required
