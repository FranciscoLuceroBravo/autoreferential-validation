import pandas as pd
import numpy as np

df = pd.read_csv("450000_pairs.csv")

# Ordenar por número de pares
df_sorted = df.sort_values('j')

# Puntos de análisis
checkpoints = [100000, 200000, 300000]

for N in checkpoints:
    subset = df_sorted.iloc[:N]
    D_max = subset['D'].max()
    
    log_N = np.log(N)
    log_Dmax = np.log(D_max)
    
    print(f"N = {N:,}")
    print(f"  D_max = {D_max:,}")
    print(f"  log(N) = {log_N:.4f}")
    print(f"  log(D_max) = {log_Dmax:.4f}")
    print()
