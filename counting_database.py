import pandas as pd

df = pd.read_csv("450000_pairs.csv")

# Análisis básico
print(f"Total de pares: {len(df)}")
print(f"Rango de j: [{df['j'].min()}, {df['j'].max()}]")
print(f"Rango de n: [{df['n'].min()}, {df['n'].max()}]")
print(f"Rango de d: [{df['d'].min()}, {df['d'].max()}]")

# Distribución por d
print("\n=== Distribución por d (top 20) ===")
d_dist = df['d'].value_counts().sort_index().head(20)
print(d_dist)

# j's únicos
unique_j = df['j'].nunique()
print(f"\n=== j's únicos: {unique_j} ===")

# n's únicos  
unique_n = df['n'].nunique()
print(f"n's únicos: {unique_n}")

# Congruentes de d=2
d2_subset = df[df['d'] == 2]
congruent_from_d2 = set()
for _, row in d2_subset.iterrows():
    C = row['n'] * (row['n']-1) * (2*row['n']-1)
    congruent_from_d2.add(C)
print(f"\n=== Congruentes únicos de d=2: {len(congruent_from_d2)} ===")

# Congruentes de d>2
d_gt_2_subset = df[df['d'] > 2]
congruent_from_d_gt_2 = set()
for _, row in d_gt_2_subset.iterrows():
    C = row['j'] * (row['j']-1) * (2*row['j']-1)
    congruent_from_d_gt_2.add(C)
print(f"Congruentes únicos de d>2: {len(congruent_from_d_gt_2)} ===")

# Overlap
overlap = congruent_from_d2 & congruent_from_d_gt_2
print(f"Overlap (d=2 ∩ d>2): {len(overlap)} ===")

# Total (unión)
all_congruent = congruent_from_d2 | congruent_from_d_gt_2
print(f"\n=== Total congruentes únicos: {len(all_congruent)} ===")

# Verificación
print(f"Suma sin overlap: {len(congruent_from_d2) + len(congruent_from_d_gt_2) - len(overlap)}")
