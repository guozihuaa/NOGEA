# NOGEA: Network-Oriented Gene Entropy Approach for Dissecting Disease Comorbidity and Drug Repositioning
Rapid development of high-throughput technologies has permitted the identification of an increasing number of disease-associated genes (DAGs), which are important for understanding disease initiation and developing precision therapeutics. However, DAGs often contain large amounts of redundant or false positive information, leading to difficulties in quantifying and prioritizing potential relationships between these DAGs and human diseases. Here, a network-oriented gene entropy approach (NOGEA) is proposed for accurately inferring master genes that contribute to specific diseases by quantitatively calculating their perturbation abilities on directed disease-specific gene networks. 

## Required packages
- igraph
- ROCR (or pROC) 
- ggplot2
- beanplot
- dplyr

## Usage
### Functions:

* `mutildisease_entropy` calcualte gene entropy for each DAG in each disease.

* `multi_DAG_class` Disease-gene classification based on the gene entropy value.

## Example

# Citation
if you use NOGEA or NOGEA related methods please cite: 
