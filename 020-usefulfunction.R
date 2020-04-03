#################
### functions used in this research
##############

##### convert distance to probability

effect_prob <- function(x, alpha){exp(-x * alpha)}

#### calculate gene entropy for single disease 

Gene_entropy5 <- function(genes, 
                          outdegree, 
                          alpha){
  teminter.distance <- dagnetwork.distance[genes, genes]
  temp.prob.mat <- effect_prob(teminter.distance,  alpha)

  diag(temp.prob.mat) <- 0
  temp.prob.mat[is.nan(temp.prob.mat)] <- 0
  
  
  totalpro <- sum(temp.prob.mat)
  temp.prob.mat2 <- temp.prob.mat / totalpro
  
  outdegree <- outdegree[colnames(temp.prob.mat2)]
  
  temp.entro <- apply(temp.prob.mat2, 1, 
                      function(x){-sum(x * outdegree * log(x), na.rm = T) / sum(outdegree)})
  
  names(temp.entro) <- genes
  
  return(temp.entro)
}

#####  calculate gene entropy for multiple diseases

mutildisease_entropy <- function(dagassociation = disease_gene,
                                 diseaseids = diseaseID1,
                                 outdegree = outdegree,
                                 dagnetwork.distance = dagnetwork.distance,
                                 dagbackground = all_genes,
                                 alpha = 1,
                                 scales = T
){
  disease.entropy.list <- list()
  
  for (i in diseaseids) {
    temp.gene <- dagassociation[[i]]%>%
      unlist() %>%
      intersect(dagbackground) %>%
      unique() 
    
    # temp.gene <- filter(all.relation.data, Disease == i) %>%
    #   dplyr::select(Gene) %>%
    #   unlist() %>%
    #   intersect(unique(unlist(directppi))) %>%
    #   unique() 
    
    temp.entropy <- Gene_entropy5(temp.gene,outdegree,alpha)
    
    disease.entropy.list[[i]] <- temp.entropy
    rm(temp.entropy, temp.gene)
  }
  
  if (scales == T) {
    allentropy <- lapply(disease.entropy.list, function(x){
      (x - mean(x)) / sd(x)
    })
    
  } else {
    allentropy <- disease.entropy.list
  }
  
  return(allentropy)
  
}


#### disease gene threshold determination


MIR_threshold <- function(myvextor,
                          up1 = 0.51,
                          up2 = 0.9,
                          down1 = 0.1,
                          down2 = 0.49){
  allrank <-  order(myvextor, decreasing = T)
  rankquan <- allrank/ length(allrank)
  
  upth <- first(allrank[(rankquan > up1) & (rankquan < up2)]) +1  
  downth <- first(allrank[(rankquan > down1) & (rankquan < down2)]) 
  c(downth,  upth)
}

##### disease gene classfication for single disease


##### disease gene classfication for mulitple diseases

multi_DAG_class <- function(entropy_list = entropy_list,
                                up1 = 0.51,
                                up2 = 0.9,
                                down1 = 0.1,
                                down2 = 0.49){
  
  entropy_diff <- entropy_list %>% 
                 lapply(sort) %>% 
                lapply(diff)
  
  allthre <- lapply(entropy_diff, function(x){MIR_threshold(x,
                                                            up1 = up1,
                                                            up2 = up2,
                                                            down1 = down1,
                                                            down2 = down2)})
  
  
  divedielis <- list()
  
  entropyvaluelist <- entropy_list %>% 
                     lapply(sort)
  
  for (i in 1:length(entropyvaluelist)) {
    lowth <- allthre[[i]][1]
    highth <- allthre[[i]][2] 
    geneno <- length(entropyvaluelist[[i]])
    
    lowgene <- entropyvaluelist[[i]][1:lowth]
    meidumgene <- entropyvaluelist[[i]][(lowth + 1):(highth -1)]
    highgene <- entropyvaluelist[[i]][highth:geneno]
    
    divedielis[[i]] <- data.frame(entropy = c(lowgene, meidumgene, highgene),
                                  class = c(rep("Redundant", lowth), rep("Interim", highth - lowth -1 ), rep("Master", geneno-highth + 1)),
                                  disease = names(entropyvaluelist)[i]) %>% 
      rownames_to_column()
    
  }
  
  
  allgeneclas <- bind_rows(divedielis)
  
}


