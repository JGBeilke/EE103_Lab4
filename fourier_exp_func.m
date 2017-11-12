function [c_k] = fourier_exp_func(x, t, n_k, p, r_p)

% c_k = exponential fourier series coefficient.
% x   = single period of a signal.
% t   = time corrosponding to 'x'.
% n_k = (optional input) number of exponential terms.
% p   = plotting option ; p=0, no plots, p = 1 plot Ck vs k and reconstructed signal.
% dT  = t(2)-t(1) = temporal resolution of signal (x).
% T   = peiod of signal 'x'.
% w0  = angular frequency of signal 'x'.
% r_p = optional number of reconstructed periods

  dT  = t(2) - t(1);
  T   = dT*length(t);
  w_0 = 2 * pi/T;

  if nargin < 2
    error('Not enough input arguments!')
  elseif nargin == 2
    n_k=101;
    p=0;
  elseif nargin == 3
    p = 0;
  elseif nargin == 4
    r_p = 1;
  end

  k = -floor(n_k/2):floor(n_k/2);

  for i = 1 : length(k)

    c_k(i) = (1/T) * trapz(t , x .* exp(-j * k(i) * w_0 * t))

  end

  if p == 1

    w_0k = w_0 * k;
    fig1 =figure('name', 'Magnitude and Angle of Fourier Coefficients for a Given Signal');

    subplot(2,1,1);
    stem(w_0k, abs(c_k));
    title('|C_k| vs \omega');
    xlabel('\omega');

    subplot(2,1,2);
    stem(w_0k, angle(c_k) * 180/pi);
    title('\angle C_k vs \omega')
    xlabel('\omega');
    ylabel('degrees');

    %x_periodic = repmat(x, 1, 5);                     %make 5 copies of x
    %t_extended = linspace(0, 10, length(x_periodic)); %generate evenly spaced t values for x periodic

    x_reconstruct = zeros(1, length(t));

    for i = 1 : length(k)
      x_reconstruct = x_reconstruct + c_k(i) * exp(j * k(i) * w_0 * t);
    end

    x_recon_long = repmat(x_reconstruct, 1, r_p);
    new_t = T * r_p;
    t_recon_long =  dT : dT : new_t;

    fig2 = figure('name', 'Reconstruction of a Given Signal Using Fourier Coeff.');
    plot(t_recon_long, x_recon_long);
    xlim([0 (T*r_p)]);
    title('x reconstructed vs t');
    xlabel('t');
    ylabel('x reconstructed');

    iptwindowalign(fig1, 'right', fig2, 'left');

  end
