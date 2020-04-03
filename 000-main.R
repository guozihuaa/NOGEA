rm(list = ls())

source("010-usefullibrary.R")
source("020-usefulfunction.R")
source("101-importdata.R")


#### calcualte gene entropy for each DAG in each disease

entropy_list <- mutildisease_entropy(dagassociation = disease_gene,
                                     diseaseids = names(disease_gene),
                                     outdegree = myoutdegree,
                                     dagnetwork.distance = dagnetwork.distance,
                                     dagbackground = all_genes,
                                     alpha = 1.1,
                                     scales = T)

# Disease-gene classification based on the gene entropy value



dag_class_result <- multi_DAG_class(entropy_list = entropy_list)
