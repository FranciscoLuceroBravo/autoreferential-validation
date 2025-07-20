# ======================
# Parámetros autoreferenciales
# ======================

# Selecciona manualmente (d, n, j) triples que satisfacen D(d)_n = 2j(j-1)
triples = [
    (2, 4, 7),   # D = 84, clásico
    (2, 5, 10),  # D = 180
    (2, 8, 21),  # D = 840
    (3, 6, 16),  # D = 480
    (3, 10, 36), # D = 2520
    (4, 8, 29),  # D = 1624
    (5, 10, 46), # D = 4140
    (6, 3, 7),   # D = 78
]

# ======================
# Loop para análisis de curvas
# ======================

for d, n, j in triples:
    print(f"\n===============================")
    print(f"Análisis para (d={d}, n={n}, j={j})")
    
    # Construye el valor D = D^{(d)}_n
    D = n * (n - 1) * (d * n - d + 1)
    print(f"Operador D^{d}_{n} = {D}")
    
    # Define la curva ED: y^2 = x^3 - D^2 x
    ED = EllipticCurve([0, 0, 0, -D^2, 0])
    print(f"Curva ED: y^2 = x^3 - {D^2}·x")
    
    # Calcula el rango de la curva
    try:
        r = ED.rank()
        print(f"Rango de ED: {r}")
    except Exception as e:
        print(f"Error al calcular rango: {e}")
    
    # Punto generado desde triángulo con catetos (D, 2j - 1)
    a = D
    b = 2*j - 1
    c = sqrt(a^2 + b^2)
    print(f"Triángulo: catetos ({a}, {b}), hipotenusa: {c}")
    
    x_coord = (c/2)^2
    try:
        point = ED.lift_x(x_coord)
        print(f"Punto racional en ED desde triángulo: {point}")
    except Exception as e:
        print(f"No se pudo encontrar punto racional en ED con x = {(c/2)^2}: {e}")
    
    # Curva asociada EC: y^2 = x^3 - C^2 x, con C = j(j-1)(2j-1)
    C = j * (j - 1) * (2*j - 1)
    EC = EllipticCurve([0, 0, 0, -C^2, 0])
    print(f"Curva dual EC: y^2 = x^3 - {C^2}·x")

    try:
        r2 = EC.rank()
        print(f"Rango de EC: {r2}")
    except Exception as e:
        print(f"Error al calcular rango de EC: {e}")

    # Probar lift_x también en EC
    x2 = (c/2)^2
    try:
        p2 = EC.lift_x(x2)
        print(f"Punto racional en EC desde triángulo: {p2}")
    except Exception as e:
        print(f"No se pudo encontrar punto racional en EC: {e}")
