#/bin/bash
/usr/local/cuda-8.0/bin/nvcc tf_sampling_g.cu -o tf_sampling_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC
#TF_INC=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')
#TF_LIB=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')
# TF1.2
g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I /home/linzhuo/anaconda3/envs/py27tf12/lib/python2.7/site-packages/tensorflow/include -I /usr/local/cuda-8.0/include -lcudart -L /usr/local/cuda-8.0/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# TF1.4
#g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I /home/linzhuo/anaconda3/envs/py27tf14/lib/python2.7/site-packages/tensorflow/include -I /usr/local/cuda-8.0/include -I /home/linzhuo/anaconda3/envs/py27tf14/lib/python2.7/site-packages/tensorflow/include/external/nsync/public -lcudart -L /usr/local/cuda-8.0/lib64/ -L/home/linzhuo/anaconda3/envs/py27tf14/lib/python2.7/site-packages/tensorflow -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0 
#g++ -I$TF_INC/external/nsync/public -L$TF_LIB -ltensorflow_framework
