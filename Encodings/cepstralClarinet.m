%% Cepstral analysis for Clarinet
% Jacques Martell Villalpando
% A00822006@itesm.mx

% Load sound files
[x1, fs] = audioread('Clr_B2.wav');
[x2, ~] = audioread('Clr_B3.wav');
[x3, ~] = audioread('Clr_B4.wav');
[x4, ~] = audioread('Clr_B5.wav');
[x5, ~] = audioread('Clr_B6.wav');
[x6, ~] = audioread('Clr_B7.wav');

% Trim sound files to same size
N = min([length(x1), length(x2), length(x3), length(x4), length(x5), length(x6)]);
x1 = x1(1:N);
x2 = x2(1:N);
x3 = x3(1:N);
x4 = x4(1:N);
x5 = x5(1:N);
x6 = x6(1:N);

% Normalize
x1 = x1 / max(abs(x1));
x2 = x2 / max(abs(x2));
x3 = x3 / max(abs(x3));
x4 = x4 / max(abs(x4));
x5 = x5 / max(abs(x5));
x6 = x6 / max(abs(x6));

n = linspace(0, N-1, N) / fs;

% Cepstral analysis
[C1, Q] = cepstrum(x1, fs);
[C2, ~] = cepstrum(x2, fs);
[C3, ~] = cepstrum(x3, fs);
[C4, ~] = cepstrum(x4, fs);
[C5, ~] = cepstrum(x5, fs);
[C6, ~] = cepstrum(x6, fs);

% Domains
Q = Q * 1000;
C = [C1, C2, C3, C4, C5', C6];
B = ones(length(Q), 1);

% Plot
for b = 1 : 6
    plot3(Q, B * b, C(:,b), 'LineWidth', 2.5)
    hold on
end
axis tight

set(gca, 'XScale', 'log')

title('Cepstro del clarinete','FontSize',16)
legend('Banda 2','Banda 3','Banda 4','Banda 5','Banda 6','Banda 7',...
    'Location','best','FontSize',12)
xlabel('Cuefrencia [ms]','FontSize',14)
ylabel('Banda crítica','FontSize',14)
zlabel('Amplitud','FontSize',14)

xlim([0, max(Q)])
zlim([0, 1])