import csv
from sage.all import *

# --- CONFIGURACIÓN ---
INPUT_FILE = "450000_pairs.csv"
OUTPUT_REPORT = "clasificacion_densidad_d.csv"
VENTANA_J = 50000  # Bloques de escala para observar la evolución

def clasificar_contribucion_d():
    print(f"[INFO] Analizando Clasificación de Contribución por Dimensión...")
    
    # bloques: {idx_bloque: {d: conteo}}
    bloques = {}
    total_por_d_global = {}
    
    try:
        with open(INPUT_FILE, mode='r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                j_val = int(row['j'])
                d_val = int(row['d'])
                
                idx_bloque = (j_val // VENTANA_J) * VENTANA_J
                
                if idx_bloque not in bloques:
                    bloques[idx_bloque] = {}
                
                bloques[idx_bloque][d_val] = bloques[idx_bloque].get(d_val, 0) + 1
                total_por_d_global[d_val] = total_por_d_global.get(d_val, 0) + 1

        # --- REPORTE DE CONTRIBUCIÓN GLOBAL ---
        print("\n" + "="*60)
        print(f"{'RANK':<5} | {'DIMENSIÓN d':<15} | {'TOTAL NODOS':<15} | {'% TOTAL'}")
        print("-" * 60)
        
        total_general = sum(total_por_d_global.values())
        d_rankeadas = sorted(total_por_d_global.items(), key=lambda x: x[1], reverse=True)
        
        for i, (d, total) in enumerate(d_rankeadas[:10], 1): # Top 10 contribuyentes
            porcentaje = (total / float(total_general)) * 100
            print(f"{i:<5} | d = {d:<11} | {total:<15} | {porcentaje:.2f}%")
        
        # --- REPORTE EVOLUTIVO (CSV) ---
        bloques_ordenados = sorted(bloques.keys())
        dims_principales = [d for d, _ in d_rankeadas[:5]] # Tomamos las 5 más activas
        
        print("\n" + "="*85)
        print(f"{'Rango j':<20} | Contribución de D principales (Nodos)")
        print("-" * 85)

        with open(OUTPUT_REPORT, mode='w', newline='') as f_out:
            writer = csv.writer(f_out)
            writer.writerow(['j_inicio', 'total_bloque'] + [f'd_{d}' for d in dims_principales])

            for b in bloques_ordenados:
                total_b = sum(bloques[b].values())
                fila = [b, total_b]
                
                # Feedback en terminal simplificado
                print(f"{b:<9}-{b+VENTANA_J:<9} | Total: {total_b:<6} | Dominante: d={max(bloques[b], key=bloques[b].get)}")
                
                for d in dims_principales:
                    fila.append(bloques[b].get(d, 0))
                writer.writerow(fila)

        print("="*85)
        print(f"[EXITO] Clasificación guardada en: {OUTPUT_REPORT}")

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    clasificar_contribucion_d()
