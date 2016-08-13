## Problem
* Motif finding
* Sequence patterns
  For example, we want to use a better to describe the following patterns in the figure. 
 ![MAQC_sampleA_contextGenomic](https://github.com/yaozhong/ns_profiling/blob/master/A.back.fore.png)
  
 How to profiling these sequences, how to uncover potential sequence patterns in a list of sequences?

The basic tools for profiling these sequences is kmer-based counting and calcuate n-order Markov models. 
Based on the foreground and background sequences and calcuate kmer.postion.matrix pt.mat as the model,
that each element of the matrix is k-mer frequence list for the k and postion. 

We investigated the foreground and background model profiling a random selected foreground/background
sequence (trained) and (?test)

** A foreground sequence
![foreseq_foreModel_backModel](https://github.com/yaozhong/ns_profiling/blob/master/foreseq_foreModel_backModel.png)

** A background sequence
![backseq_foreModel_backModel](https://github.com/yaozhong/ns_profiling/blob/master/backseq_foreModel_backModel.png)
