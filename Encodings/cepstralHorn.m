%% Cepstral analysis for French Horn
% Jacques Martell Villalpando
% A00822006@itesm.mx

% Load sound files
[x1, fs] = audioread('Hrn_B2.wav');
[x2, ~] = audioread('Hrn_B3.wav');
[x3, ~] = audioread('Hrn_B4.wav');
[x4, ~] = audioread('Hrn_B5.wav');

% Trim sound files to same size
N = min([length(x1), length(x2), length(x3), length(x4)]);
x1 = x1(1:N);
x2 = x2(1:N);
x3 = x3(1:N);
x4 = x4(1:N);

% Normalize
x1 = x1 / max(abs(x1));
x2 = x2 / max(abs(x2));
x3 = x3 / max(abs(x3));
x4 = x4 / max(abs(x4));

n = linspace(0, N-1, N) / fs;

% Cepstral analysis
[C1, Q] = cepstrum(x1, fs);
[C2, ~] = cepstrum(x2, fs);
[C3, ~] = cepstrum(x3, fs);
[C4, ~] = cepstrum(x4, fs);

% Domains
Q = Q * 1000;
C = [C1, C2, C3, C4];
B = ones(length(Q), 1);

% Plot
for b = 1 : 4
    plot3(Q, B * b, C(:,b), 'LineWidth', 2.5)
    hold on
end
axis tight

set(gca, 'XScale', 'log')

title('Cepstro del corno francés','FontSize',16)
legend('Banda 2','Banda 3','Banda 4','Banda 5','Location','best','FontSize',12)
xlabel('Cuefrencia [ms]','FontSize',14)
ylabel('Banda crítica','FontSize',14)
zlabel('Amplitud','FontSize',14)

xlim([0, max(Q)])
zlim([0, 1])