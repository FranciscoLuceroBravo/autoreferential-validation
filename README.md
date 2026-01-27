========================================================================
ALGEBRAIC GENERATIVE FRAMEWORK FOR CONGRUENT NUMBERS
========================================================================

Author: Francisco J. Lucero Bravo
Independent Researcher - Santiago, Chile
Contact: fjlucerob@gmail.com

------------------------------------------------------------------------
RESEARCH OVERVIEW
------------------------------------------------------------------------
This repository provides the computational evidence and generative 
algorithms supporting the research paper: "A Purely Algebraic 
Generative Framework for Congruent Numbers".

The framework introduces a deterministic algebraic operator capable of 
identifying congruent numbers through an autoreferential identity:
D_n(d) = n(n-1)(d(n-1)+1) = 2j(j-1).

While d=2 represents the core seed of classical Pythagorean areas, 
higher dimensions (d > 2) are shown to preserve congruency through 
verified rational maps and elliptic curve isomorphisms.

------------------------------------------------------------------------
CORE REPOSITORY FILES
------------------------------------------------------------------------

1. DATASETS
- 450000_pairs.csv: Primary dataset (450,573 entries) recording the 
  network's expansion from d=2 up to d ≈ 10^10.
- Tunnell1000random.csv: Statistical validation results against 
  Tunnell’s Criterion for sampled consistency.

2. GENERATIVE & STATISTICAL ENGINES
- autoref_1G_validation.sage: The main generative engine using the 
  inverse equation logic to project congruent candidates.
- counting_database.py: Statistical audit script confirming the power-law 
  distribution and the "funnel effect" of the generative process.
- log_table.py: Computes asymptotic density, confirming the power-law 
  exponent α ≈ 2 via log(N) vs. log(D_max) analysis.

3. ELLIPTIC CURVE VALIDATION
- twist_extension.sage.py: Validates the "Table of 17 Routes", confirming 
  isomorphisms between extended curves and anchor curves.
- rank_ec.sage.py: Verifies the Mordell-Weil rank to ensure rational 
  points of infinite order.
- test_mapa_racional.sage.py: Tools to analyze isogenies and rational 
  maps between specific network nodes.
- ec_structure_robust.sage.py: Analyzes j-invariants and discriminants 
  to ensure structural integrity.

4. ROBUSTNESS & VISUALIZATION
- tunnell_validation.sage.py: Redundancy audit for the d=2 core, ensuring 
  consistency with classical arithmetic criteria.
- infinity_robustness.sage.py: Stress tests for the operator's stability 
  in the asymptotic limit.
- ec_visual.sage.py / graph.sage: Topological visualization of the 
  congruent number network connectivity.

------------------------------------------------------------------------
USAGE & REQUIREMENTS
------------------------------------------------------------------------
- Requirements: SageMath (9.0+), Python 3.8+, Pandas, NumPy.
- To replicate the 17 Routes validation: run 'sage twist_extension.sage.py'
- To verify core redundancy: run 'sage tunnell_validation.sage.py'

------------------------------------------------------------------------
KEY FINDINGS
------------------------------------------------------------------------
- Transition from probabilistic to deterministic generation of D.
- Asymptotic density growth follows a stable power-law with α ≈ 2.
- Every node in the network is linked to a Pythagorean seed (d=2) 
  through a verifiable algebraic map.
========================================================================
