# GPU-version Tensorflow Setup on Macbook Pro
--------------------------------

## Background
Tensorflow has provide a GPU version for osx. 
My macbook pro (early 2013) just has a Nvida GPU GTX 650M, which has 1G memeory and 384 cores (usable).

## Steps
Follow instructions step by step
[install instructions](https://www.tensorflow.org/versions/r0.10/get_started/os_setup.html)

* Install Cuda Toolkit 7.5 and cuDNN **v4**(need to be registered)
  * cuDNN copy files in the *include* and *lib* to the Cuda Toolkit installation fold 
  <pre><code>
  /usr/local/cuda/lib
  /usr/local/cuda/include
  </code></pre>

## Problem solving
1. "ImportError: No module named protobuf"
   <pre><code>
   brew reinstall --devel protobuf
   </code></pre>
   
2. "libcuda.1.dylib not finding" during import tensorflow
  <pre><code>
  sudo ln -s libcuda.dylib libcuda.1.dylib
  </code></pre>
