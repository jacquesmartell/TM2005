%% Cepstrum
% Jacques Martell Villalpando
% A00822006@itesm.mx

function [C, q] = cepstrum(x, fs)

% Cepstrum
C = real(ifft(log(abs(fft(x)))));
C = C(1 : ceil(end/2));

% Quefrency
q = linspace(0, length(C), length(C)) / fs;
q = q';
end
