close all
clear all
clc

dT=0.001;
t1=dT:dT:1;
t2=1+dT:dT:2;
x1=5*ones(size(t1));
x2=-5*ones(size(t2));
x_single_period=[x1 x2];
t_single_period=[t1 t2];

fourier_exp_func(x_single_period, t_single_period, 101, 1);
