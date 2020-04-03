# import the libraries used in this research

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager") 
if(!require('dplyr')){
  BiocManager::install('dplyr',ask = F,update = F)
}
if(!require('igraph')){
  BiocManager::install(c( 'igraph'),ask = F,update = F)
}
if(!require('fitdistrplus')){
  BiocManager::install(c( 'fitdistrplus'),ask = F,update = F)
}
if(!require('evd')){
  BiocManager::install(c( 'evd'),ask = F,update = F)
}
if(!require('matrixStats')){
  BiocManager::install(c( 'matrixStats'),ask = F,update = F)
}

if(!require('tibble')){
  BiocManager::install(c( 'tibble'),ask = F,update = F)
}


library(dplyr)
library(igraph)
library(fitdistrplus)
library(evd)
library(matrixStats)
library(tibble)

