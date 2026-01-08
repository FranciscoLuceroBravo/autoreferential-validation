================================================================================
STRUCTURED SUBFAMILIES OF CONGRUENT NUMBERS: COMPUTATIONAL FRAMEWORK
================================================================================
Author: Francisco Javier Lucero Bravo
Date: January 2026
Language: SageMath / Python 3.x
--------------------------------------------------------------------------------

This repository contains the mathematical implementation of the "Lucero Network"
and the Recursive Power Operators (RPM) for generating structured subfamilies 
of congruent numbers, as described in the preprint: "Structured Subfamilies of 
Congruent Numbers via Recursive Power Operators and Autoreferential Networks".

---
1. CORE CONCEPTS
---
The provided scripts validate that numerical congruence is an emergent 
structural property linked to the "Oblong Nucleus" n(n-1). Unlike stochastic 
searches, this framework uses a deterministic operator:
D_n^(d) = n(n-1)(dn - d + 1)

The network is organized around a core at d=2 (Parametric Order 2).

---
2. FILE DESCRIPTIONS
---

[MW_sum.sage.py]
Theoretic validation script. It demonstrates that the anchor points (n=4, n=5, 
n=8) are EXCEPTIONAL and RARE integral points. By performing the Mordell-Weil 
sum of anchors P1(4, 13) and P2(5, 19), the script shows the resulting point 
is rational but not an integral anchor. This confirms that these nodes are 
unique arithmetic occurrences rather than trivial products of the group law.

[rank_ec.sage.py / elliptic_curve.sage.py]
Defines the elliptic curve y^2 = 4n^3 - 6n^2 + 2n + 1. Uses the 
'integral_points()' method to verify the finiteness of the primary anchors 
under Siegel's Theorem and calculates the rank (Mordell-Weil Rank = 2).

[autoref_validation.sage.py]
The main engine. It iterates through dimensions (d) and parameters (n) to 
identify nodes where D_n^(d) = 2j(j-1). It was used to generate the 450,000 
case database mentioned in the research.

[rep.sage.py]
"Reverse Engineering Protocol". It decomposes classical elliptic curves (like 
the Fibonacci curve for n=6) to reveal the hidden "Area Operator" and its 
tuning parameters, providing a path toward structural unification.

[densidad_lucero.sage.py]
Analyzes the internal density of the subfamily (rho ≈ 0.152) and the variance 
of the "arithmetic vein," confirming the regularity of the distribution.

[densidad_smith_lucero.sage.py]
Compares the Lucero Network's coverage against the 60% theoretical natural 
density predicted by Alexander Smith. It distinguishes between global 
density and the "penetration ratio" of this structured subfamily.

[infinity_test.sage.py / infinity_robustness.sage.py]
Log-log regression analysis to prove the asymptotic persistence of the network. 
Confirms a slope alpha ≈ 2.0, proving the subfamily is infinite and 
characterizing it as a process of "dilution" rather than "extinction."

[graph_code.txt]
Python code using NetworkX to visualize the "hub-and-spoke" architecture of 
the network, where superior dimensions converge into the d=2 nucleus.

---
3. USAGE
---
These scripts are designed to run in a SageMath environment.
To execute a script:
$ sage <filename>.sage.py

---
4. CITATION
---
Please cite the original work if you use these algorithms:
Lucero Bravo, F. J. (2025). "Structured Subfamilies of Congruent Numbers via 
Recursive Power Operators and Autoreferential Networks". Independent Researcher.

================================================================================
