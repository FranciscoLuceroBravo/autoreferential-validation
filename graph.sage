import networkx as nx
import matplotlib.pyplot as plt

# Crear el grafo dirigido
G = nx.DiGraph()

# Definir el rango de dimensiones y n
min_d, max_d = 2, 5
min_n, max_n = 2, 1000

# Poblamos el grafo con las aristas (d,n) → (2,j) si se cumple la condición
for d in range(min_d, max_d + 1):
    for n in range(min_n, max_n + 1):
        D = n * (n - 1) * (d * n - d + 1)
        # Intentamos resolver D = 2j(j - 1)
        # LA LÍNEA CORREGIDA ESTÁ AQUÍ:
        disc = 1 + 2 * D  # Discriminante correcto para resolver j
        
        sqrt_disc = int(disc**0.5)
        if sqrt_disc * sqrt_disc == disc: # Verifica si 1+2D es un cuadrado perfecto
            j = (1 + sqrt_disc) // 2
            # Se añade una verificación adicional para asegurar que j sea positivo y válido
            if j > 0 and j * (j - 1) * 2 == D:
                G.add_edge((d, n), (2, j))

# --- Estas líneas de verificación para depuración ---
print(f"Número de nodos en el grafo: {G.number_of_nodes()}")
print(f"Número de aristas en el grafo: {G.number_of_edges()}")
# ----------------------------------------------------

# Configuración de nodos y colores por dimensión
node_colors = []
for node in G.nodes:
    if node[0] == 2:
        node_colors.append('red')  # núcleo
    else:
        node_colors.append('skyblue')  # dimensión estructural

# Posición usando layout jerárquico
# Podemos mantener k=0.2 o probar un k ligeramente diferente si los nodos se superponen
pos = nx.spring_layout(G, k=0.2, iterations=100, seed=int(42))

# Dibujamos el grafo
plt.figure(figsize=(24, 18)) # Aumentar drásticamente el tamaño de la figura (más espacio)
nx.draw_networkx_nodes(G, pos, node_color=node_colors, node_size=1500) # Nodos mucho más grandes
nx.draw_networkx_edges(G, pos, arrows=True, alpha=0.5, width=1.5) # Aristas un poco más gruesas
nx.draw_networkx_labels(G, pos, font_size=14, font_color='black') # Etiquetas mucho más grandes

plt.title("Autoreferential Congruent Graph $G$: Subgraph for $2 \\leq d \\leq 5$", fontsize=24) # Título más grande
plt.axis('off')
plt.tight_layout()
plt.savefig("congruent_graph_nuclear_core.png", dpi=300)
plt.show()
