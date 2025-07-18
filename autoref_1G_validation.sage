from sage.all import ZZ, ceil, sqrt, is_square
import time
import os

# Configuración para 1 millón de pares
MAX_J = 1000000  # j hasta 1,000,000
OUTPUT_FILE = "million_pairs.csv"
BATCH_SIZE = 100000

def generate_pairs(max_j):
    """Genera pares usando la ecuación inversa optimizada"""
    count = 0
    for j in range(2, max_j + 1):
        # Calcular D = 2j(j-1) (ecuación inversa)
        D_val = 2 * j * (j - 1)
        
        # Resolver n(n-1)(d*n - d + 1) = D_val
        # Buscar factores n(n-1) de D_val
        for n in range(2, ceil(sqrt(D_val)) + 1):
            # n y n-1 deben dividir a D_val
            if D_val % (n * (n - 1)) != 0:
                continue
                
            # Calcular k = D_val / [n(n-1)]
            k = D_val // (n * (n - 1))
            
            # Resolver k = d(n-1) + 1 para d
            d_val = (k - 1) / (n - 1)
            
            if d_val in ZZ and d_val >= 2:
                yield (int(d_val), n, j, D_val)
                count += 1
                if count % 100000 == 0:
                    print(f"Generados {count} pares...")

# Procesamiento principal
start_time = time.time()
total_pairs = 0

with open(OUTPUT_FILE, 'w') as f:
    f.write("d,n,j,D\n")
    batch_count = 0
    
    for pair in generate_pairs(MAX_J):
        d, n, j, D = pair
        f.write(f"{d},{n},{j},{D}\n")
        total_pairs += 1
        batch_count += 1
        
        if batch_count >= BATCH_SIZE:
            f.flush()  # Forzar escritura a disco
            os.fsync(f.fileno())
            batch_count = 0
            print(f"Escritos {total_pairs} pares...")

print(f"¡Proceso completado! Tiempo: {time.time()-start_time:.2f}s")
print(f"Total de pares encontrados: {total_pairs}")
