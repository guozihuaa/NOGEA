# NOGEA: Network-Oriented Gene Entropy Approach for Dissecting Disease Comorbidity and Drug Repositioning
Rapid development of high-throughput technologies has permitted the identification of an increasing number of disease-associated genes (DAGs), which are important for understanding disease initiation and developing precision therapeutics. However, DAGs often contain large amounts of redundant or false positive information, leading to difficulties in quantifying and prioritizing potential relationships between these DAGs and human diseases. Here, a network-oriented gene entropy approach (NOGEA) is proposed for accurately inferring master genes that contribute to specific diseases by quantitatively calculating their perturbation abilities on directed disease-specific gene networks. 

## Schema
![pipeline](/pipeline/pipeline.png)

## Version
1.0.1

## Date 
2020.04.03

## Title
NOGEA: Network-Oriented Gene Entropy Approach for Dissecting Disease Comorbidity and Drug Repositioning

## Author
Zihu Guo <br>
Address: Center of Bioinformatics, Northwest A & F University

## Maintainer
Zihu Guo <br>
Email: <guozihu2010@yahoo.com>

## Description
<center> Network-Oriented Gene Entropy Approach for Dissecting Disease Comorbidity and Drug Repositioning

## Required packages
- R (>3.6.0)
- igraph (>1.2.4)
- ROCR 
- ggplot2
- beanplot
- dplyr (1.4.2)

## Reference manual
------------------------------------------------------------------------------ 
------------------------------------------------------------------------------
* `mutildisease_entropy` *calcualte gene entropy for each DAG in each disease.* 

------------------------------------------------------------------------------
####  Description
Calcualte gene entropy for each DAG in each disease
####  Usage
```
mutildisease_entropy(dagassociation = disease_gene,
                                     diseaseids = names(disease_gene),
                                     outdegree = myoutdegree,
                                     dagnetwork.distance = dagnetwork.distance,
                                     dagbackground = all_genes,
                                     alpha = 1.1,
                                     scales = T)
```
     
####  Arguments
- `dagassociation` a list of DAG vectors. Each DAG vector contain the gene names of the DAGs for that disease.
- `diseaseids` the diseases selected from `dagassociation`, which you want to obtain the gene entropy values
- `outdegree` out degree of each DAG in the directed PPI network
- `dagbackground` the gene names of proteins that are involved in the directed PPI network
- `alpha` the scale paratemter to convert distance to probability
- `scales` whether scale the entropy value for each disease or not

####  Details

####  Value
An object of the class list is a list containing the entropy values of DAGs in each disease 

####  Examples
```
entropy_list <- mutildisease_entropy(dagassociation = disease_gene,
                                     diseaseids = names(disease_gene),
                                     outdegree = myoutdegree,
                                     dagnetwork.distance = dagnetwork.distance,
                                     dagbackground = all_genes,
                                     alpha = 1.1,
                                     scales = T)
```

------------------------------------------------------------------------------
------------------------------------------------------------------------------
* `multi_DAG_class` Disease-gene classification based on the gene entropy value. 

------------------------------------------------------------------------------

#### Description 
Disease-gene classification based on the gene entropy value
#### Usage 
```
multi_DAG_class(entropy_list = entropy_list)
``` 
#### Arguments
- `entropy_lis`
#### Details 

#### Value 

#### Examples  
```
dag_class_result <- multi_DAG_class(entropy_list = entropy_list)
``` 


## Example to DAG entropy calculation and classification
* Open the file `NOGEA.Rproj` with Rstudio, you can find an complete example for DAG entropy calculation and gene classification in `000-main.R`
#### Import the data, libraries and functions used in this research
```
source("010-usefullibrary.R")
source("020-usefulfunction.R")
source("101-importdata.R")
```

#### Calcualte gene entropy for each DAG in each disease
```
entropy_list <- mutildisease_entropy(dagassociation = disease_gene,
                                     diseaseids = names(disease_gene),
                                     outdegree = myoutdegree,
                                     dagnetwork.distance = dagnetwork.distance,
                                     dagbackground = all_genes,
                                     alpha = 1.1,
                                     scales = T)
```

#### Disease-gene classification based on the gene entropy value

```
dag_class_result <- multi_DAG_class(entropy_list = entropy_list)
```

# Citation
if you use NOGEA or NOGEA related methods please cite:<br>
Guo Z, Fu Y, Huang C, Zheng C, Wu Z, Chen X, et al. *NOGEA: Network-Oriented Gene Entropy Approach for Dissecting Disease Comorbidity and Drug Repositioning*. bioRxiv. 2020:2020.04.01.019901. doi: 10.1101/2020.04.01.019901.
