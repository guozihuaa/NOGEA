# NOGEA: Network-Oriented Gene Entropy Approach for Dissecting Disease Comorbidity and Drug Repositioning
Rapid development of high-throughput technologies has permitted the identification of an increasing number of disease-associated genes (DAGs), which are important for understanding disease initiation and developing precision therapeutics. However, DAGs often contain large amounts of redundant or false positive information, leading to difficulties in quantifying and prioritizing potential relationships between these DAGs and human diseases. Here, a network-oriented gene entropy approach (NOGEA) is proposed for accurately inferring master genes that contribute to specific diseases by quantitatively calculating their perturbation abilities on directed disease-specific gene networks. 

## Version
1.0.1

## Date 
2020.04.03

## Title
NOGEA: Network-Oriented Gene Entropy Approach for Dissecting Disease Comorbidity and Drug Repositioning

## Author
Zihu Guo

## Maintainer
Zihu Guo <guozihu2010@yahoo.com>

## Description
Network-Oriented Gene Entropy Approach for Dissecting Disease Comorbidity and Drug Repositioning

## Required packages
- R (>3.6.0)
- igraph (>1.2.4)
- ROCR 
- ggplot2
- beanplot
- dplyr (1.4.2)

## Reference manual

### Function:
* `mutildisease_entropy` calcualte gene entropy for each DAG in each disease.

### Description

### Usage

### Arguments

### Details

### Value

### Examples





* `multi_DAG_class` Disease-gene classification based on the gene entropy value.

## Example

# Citation
if you use NOGEA or NOGEA related methods please cite:
Guo Z, Fu Y, Huang C, Zheng C, Wu Z, Chen X, et al. NOGEA: Network-Oriented Gene Entropy Approach for Dissecting Disease Comorbidity and Drug Repositioning. bioRxiv. 2020:2020.04.01.019901. doi: 10.1101/2020.04.01.019901.
