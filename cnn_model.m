clear all;
input_fmap=single(floor(512*rand(32,32,3)));
cnn_load_weight;
cnn_compute;