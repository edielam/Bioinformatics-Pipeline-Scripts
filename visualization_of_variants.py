import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import networkx as nx

# Load annotated variant data into a Pandas DataFrame
df = pd.read_csv('annotated_variants.csv', sep='\t')

# Filter variants based on specific criteria (e.g., missense variants)
filtered_df = df[df['CONSEQUENCE'] == 'MISSENSE']

# Generate a bar chart for variant distribution
variant_counts = filtered_df['VARIANT_TYPE'].value_counts()
plt.figure(figsize=(8, 6))
sns.barplot(x=variant_counts.index, y=variant_counts.values)
plt.xlabel('Variant Type')
plt.ylabel('Count')
plt.title('Distribution of Variant Types')
plt.show()

# Generate a network plot for gene impact
gene_impact_df = filtered_df[['GENE', 'CONSEQUENCE']]
gene_impact_counts = gene_impact_df['GENE'].value_counts()

# Create a network graph using NetworkX
G = nx.Graph()
for gene, count in gene_impact_counts.items():
    G.add_node(gene, count=count)

# Plot the network graph
plt.figure(figsize=(10, 8))
pos = nx.spring_layout(G, seed=42)  # Specify layout algorithm and random seed for reproducibility
nx.draw_networkx(G, pos=pos, node_size=[count * 100 for count in gene_impact_counts.values()],
                 node_color='skyblue', edge_color='gray', alpha=0.8, font_size=10)
plt.title('Impact of Variants on Genes')
plt.axis('off')
plt.show()
