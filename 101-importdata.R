### 
load("test.RData")

direct.ppi.network <- graph_from_data_frame(directed_PPI, directed = TRUE, vertices = NULL)

all_genes <- union(unique(directed_PPI$fromnode), unique(directed_PPI$tonode))

dagnetwork.distance <- distances(direct.ppi.network, 
                                 v = all_genes, 
                                 to = all_genes, 
                                 mode = "out")

myoutdegree <- degree(graph = direct.ppi.network, 
                    v = all_genes,
                    mode = "out")


