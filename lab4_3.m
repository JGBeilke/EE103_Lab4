close all
clear all
clc

dT = 0.001;                %time step
t  = dT : dT : 5;          %create time vector for one period of signal x
x  = q3_function(t);       %one period of signal x

x_long = repmat(x,1,6);    %replicate 3 periods of signal x
t_long = -4.999 : dT : 25;     %create a time vector to plot x against

fig =figure('name', 'Signal x in the Time Domain');
plot(t_long, x_long);       %plot 3 periods of signal x
title('x vs t');
ylabel('x');
xlabel('t');
movegui(fig, 'south')

fourier_exp_func(x, t, 51, 1, 5);

function y = q3_function(t)

  y = ( t.^3 - j .* 2 * pi * t.^2 ) .* (heaviside(t)-heaviside(t-5));

end
