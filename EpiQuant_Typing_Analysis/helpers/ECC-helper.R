epi_cohesion_calc <- function(g_cuts, epi_matrix){

  epi_melt <- melt(as.matrix(1 - epi_matrix)) # create similarity values from epi distance matrix
  gencuts <- g_cuts
  
  print("Starting Calculation")  
  cut_details <<- list()
  # loops through each cut % present in 'gencuts
  for(i in 1:ncol(g_cuts))  {
    #get the total number of clusters generated by the cut 'i' and stores as the variable 'seq'
    seq <- unique(g_cuts[,i])
    #create a list to use in the next loop and name it 'y'
    y <- list()
    for(j in 1:length(seq)){
      #generates a new list 'x' which returns the members belonging to each cluster identified in 'seq'
      x <- list(rownames(gencuts)[which(gencuts[,i] == seq[[j]])])
      y[j] <- x
    }
    names(y) <- seq
    z <- data.frame()
    for(k in 1:length(y)){
      #creates all the pairwise strain comparisons from the cluster 
      xselect <- expand.grid(y[[k]], y[[k]])
      #returns the epi similarities for each of the pairwise combinations in the cluster from the epi_sim melted list
      
      xselect1 <- merge(x = xselect, y = epi_melt, by.x = c("Var1", "Var2"), by.y = c("Var1", "Var2"))
      
      n1 <- length(unique(xselect1[,1]))
      s1 <- sum(xselect1[,3])
      IEC <- (s1-n1) / (n1*(n1-1))
      W_IEC <- IEC * n1
      
      #create a dataframe containing the avg epi sim and the size of each cluster in the cut
      z[k,1] <- names(y[k])
      z[k,2] <- n1
      z[k,3] <- IEC
      z[k,4] <- W_IEC
      z[k,5] <- paste(as.character(unique(xselect[,2])), collapse = ",")
      colnames(z) <- c("Cluster_Name","Cluster_Size", "ECC", "W_ECC", "Members") 
      cut_details[[colnames(g_cuts)[i]]] <- z
    }
    
    print(paste("Done Cut Method ", i))
    
    cut_details <<- cut_details
  }
}