%% Cepstral analysis for Grand Piano
% Jacques Martell Villalpando
% A00822006@itesm.mx

% Load sound files
[x1, fs] = audioread('Pno_B1.wav');
[x2, ~] = audioread('Pno_B2.wav');
[x3, ~] = audioread('Pno_B3.wav');
[x4, ~] = audioread('Pno_B4.wav');
[x5, ~] = audioread('Pno_B5.wav');
[x6, ~] = audioread('Pno_B6.wav');
[x7, ~] = audioread('Pno_B7.wav');
[x8, ~] = audioread('Pno_B8.wav');
[x9, ~] = audioread('Pno_B9.wav');
[x10, ~] = audioread('Pno_B10.wav');
[x11, ~] = audioread('Pno_B11.wav');

% Trim sound files to same size
N = min([length(x1), length(x2), length(x3), length(x4), length(x5),...
    length(x6), length(x7), length(x8), length(x9), length(x10), length(x11)]);
x1 = x1(1:N);
x2 = x2(1:N);
x3 = x3(1:N);
x4 = x4(1:N);
x5 = x5(1:N);
x6 = x6(1:N);
x7 = x7(1:N);
x8 = x8(1:N);
x9 = x9(1:N);
x10 = x10(1:N);
x11 = x11(1:N);

% Normalize
x1 = x1 / max(abs(x1));
x2 = x2 / max(abs(x2));
x3 = x3 / max(abs(x3));
x4 = x4 / max(abs(x4));
x5 = x5 / max(abs(x5));
x6 = x6 / max(abs(x6));
x7 = x7 / max(abs(x7));
x8 = x8 / max(abs(x8));
x9 = x9 / max(abs(x9));
x10 = x10 / max(abs(x10));
x11 = x11 / max(abs(x11));

n = linspace(0, N-1, N) / fs;

% Cepstral analysis
[C1, Q] = cepstrum(x1, fs);
[C2, ~] = cepstrum(x2, fs);
[C3, ~] = cepstrum(x3, fs);
[C4, ~] = cepstrum(x4, fs);
[C5, ~] = cepstrum(x5, fs);
[C6, ~] = cepstrum(x6, fs);
[C7, ~] = cepstrum(x7, fs);
[C8, ~] = cepstrum(x8, fs);
[C9, ~] = cepstrum(x9, fs);
[C10, ~] = cepstrum(x10, fs);
[C11, ~] = cepstrum(x11, fs);

% Domains
Q = Q * 1000;
C = [C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11];
B = ones(length(Q), 1);

% Plot
for b = 1 : 11
    plot3(Q, B * b, C(:,b), 'LineWidth', 2.5)
    hold on
end
axis tight

set(gca, 'XScale', 'log')

title('Cepstro del piano','FontSize',16)
legend('Banda 1','Banda 2','Banda 3','Banda 4','Banda 5','Banda 6',...
    'Banda 7','Banda 8','Banda 9','Banda 10','Banda 11','Location','best','FontSize',12)
xlabel('Cuefrencia [ms]','FontSize',14)
ylabel('Banda crítica','FontSize',14)
zlabel('Amplitud','FontSize',14)

xlim([0, max(Q)])
zlim([0, 1])