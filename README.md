## Problem ##
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

#### A foreground sequence
![foreseq_foreModel_backModel](https://github.com/yaozhong/ns_profiling/blob/master/foreseq_foreModel_backModel.png)

#### A background sequence 
![backseq_foreModel_backModel](https://github.com/yaozhong/ns_profiling/blob/master/backseq_foreModel_backModel.png)

### KL divergence of differet Kmer model for the postions 
![KL divergences](https://github.com/yaozhong/ns_profiling/blob/master/kmer_model_KL.png)

We could observed from this graph, the higher order k-mer model find more different for the difference of the seqeunce.
As we may know the different for the first 10 postions should not that big!!
So higher order models has the risk of overfitting!


### working list
- [x] basic analysis of kmer based Markov models
- [ ] high efficent sampling of RNA reads
- [ ] RNN R-based implementation




