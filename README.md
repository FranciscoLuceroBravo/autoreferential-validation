# Autoreferential Congruent Validation

This repository contains the source code and data associated with the computational validation of the autoreferential congruent identity:

\[ D^{(d)}_n = 2j(j-1) \quad \text{where} \quad D^{(d)}_n = n(n-1)(dn - d + 1). \]

The code was written in SageMath and executed to verify integer solutions for \( n \leq 1{,}000{,}000 \) and various dimensions \( d \geq 2 \). The results are stored in `data/congruent_pairs_up_to_1M.csv`.

## Repository Structure

- `src/validation_code.sage`: Main script used for validation.
- `data/congruent_pairs_up_to_1M.csv`: CSV containing all validated pairs \((n, j)\).
- `figures/`: Optional visualizations (if needed).

## Author

Francisco Lucero (2025)  
