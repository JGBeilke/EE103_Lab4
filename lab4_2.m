close all
clear all
clc

dT = 0.001;                %time step
t  = -4.999 : dT : 5;      %create time vector for one period of signal x
x  = q2_function(t);       %one period of signal x

x_long = repmat(x,1,3);    %replicate 3 periods of signal x
t_long = -4.999 : dT : 25; %create a time vector to plot x against

fig =figure('name', 'Signal x in the Time Domain');
plot(t_long, x_long);      %plot 3 periods of signal x
title('x vs t');
ylabel('x');
xlabel('t');
movegui(fig, 'south');     %move the time domain figure so it is visible


fourier_exp_func(x, t, 51, 1); %use the function from part one of the lab

function y = q2_function(t) %function for lab4 question 2

  y = 0.6*(heaviside(t+2) - (cos(pi*t) + 1) .* (heaviside(t+1) - heaviside(t-1)) - heaviside(t-2));

end
