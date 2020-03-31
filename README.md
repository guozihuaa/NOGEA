# NOGEA: Network-Oriented Gene Entropy Approach for Dissecting Disease Comorbidity and Drug Repositioning
Rapid development of high-throughput technologies has permitted the identification of an increasing number of disease-associated genes (DAGs), which are important for understanding disease initiation and developing precision therapeutics. However, DAGs often contain large amounts of redundant or false positive information, leading to difficulties in quantifying and prioritizing potential relationships between these DAGs and human diseases. Here, a network-oriented gene entropy approach (NOGEA) is proposed for accurately inferring master genes that contribute to specific diseases by quantitatively calculating their perturbation abilities on directed disease-specific gene networks. 

## Required packages
- R kernel for Jupyter
- ROCR (or pROC) 
- ggplot2
- beanplot
- dplyr

## Usage
All devtools functions accept a path as an argument, e.g.
`load_all("path/to/mypkg")`. If you don't specify a path, devtools will
look in the current working directory - this is recommended practice.

### Frequent development tasks:

* `load_all()` simulates installing and reloading your package, loading R code
  in `R/`, compiled shared objects in `src/` and data files in `data/`. During
  development you usually want to access all functions (even un-exported
  internal ones) so `load_all()` works as if all functions were exported in the
  package `NAMESPACE`.

* `document()` updates generated documentation in `man/`, file collation and
  `NAMESPACE`.

* `test()` reloads your code with `load_all()`, then runs all `testthat` tests.

## Calculating gene entropy

# Citation
if you use NOGEA or NOGEA related methods please cite: 
