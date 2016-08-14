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


## installation testing

**tesing following code**

```
   import tensorflow as tf

   # Creates a graph.
   a = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[2, 3], name='a')
   b = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[3, 2], name='b')
   c = tf.matmul(a, b)

   # Creates a session with log_device_placement set to True.
   sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))

   # Runs the op
   print sess.run(c)

```
**Return message, if success**
  

```  
  I tensorflow/stream_executor/dso_loader.cc:108] successfully opened CUDA library libcublas.dylib locally
  I tensorflow/stream_executor/dso_loader.cc:108] successfully opened CUDA library libcudnn.dylib locally
  I tensorflow/stream_executor/dso_loader.cc:108] successfully opened CUDA library libcufft.dylib locally 
  I tensorflow/stream_executor/dso_loader.cc:108] successfully opened CUDA library libcuda.1.dylib locally
  I tensorflow/stream_executor/dso_loader.cc:108] successfully opened CUDA library libcurand.dylib locally
  I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:892] OS X does not support NUMA - returning NUMA node zero
  I tensorflow/core/common_runtime/gpu/gpu_init.cc:102] Found device 0 with properties: 
  name: GeForce GT 650M
  major: 3 minor: 0 memoryClockRate (GHz) 0.9
  pciBusID 0000:01:00.0
  Total memory: 1023.69MiB
  Free memory: 737.60MiB
  I tensorflow/core/common_runtime/gpu/gpu_init.cc:126] DMA: 0 
   I tensorflow/core/common_runtime/gpu/gpu_init.cc:136] 0:   Y 
   I tensorflow/core/common_runtime/gpu/gpu_device.cc:839] Creating TensorFlow device (/gpu:0) -> (device: 0, name: GeForce GT 650M, pci    bus id: 0000:01:00.0)
  Device mapping:
  /job:localhost/replica:0/task:0/gpu:0 -> device: 0, name: GeForce GT 650M, pci bus id: 0000:01:00.0
   I tensorflow/core/common_runtime/direct_session.cc:175] Device mapping:
  /job:localhost/replica:0/task:0/gpu:0 -> device: 0, name: GeForce GT 650M, pci bus id: 0000:01:00.0

   MatMul: /job:localhost/replica:0/task:0/gpu:0
   I tensorflow/core/common_runtime/simple_placer.cc:818] MatMul: /job:localhost/replica:0/task:0/gpu:0
   b: /job:localhost/replica:0/task:0/gpu:0
   I tensorflow/core/common_runtime/simple_placer.cc:818] b: /job:localhost/replica:0/task:0/gpu:0
   a: /job:localhost/replica:0/task:0/gpu:0
   I tensorflow/core/common_runtime/simple_placer.cc:818] a: /job:localhost/replica:0/task:0/gpu:0
```
