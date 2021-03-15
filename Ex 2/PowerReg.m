% Sending end voltage, power and voltage regulation of
% 3-phase medium transmission line.

% 17BEE012 - Alisamar Husain

Vr = 170.012; % Received voltage in kV
Sr = 17.12;   % Received power in MVA

Zp  = 0.017 + 0.12i; % Impedance per km
Yp  = 1.2e-6i;       % Admittance per km
len = 100;           % Length in km

% ABCD Parameters
Z = len * Zp;
Y = len * Yp;

A = ((Y*Z)/2) + 1;
B = Z;
C = Y*(((Y*Z)/4) + 1);
D = A;

T = [ A B; C D; ]

% Calculating sending end voltage and power

Ir = Sr / Vr;           % Received current

Vs = A * Vr + B * Ir    % Sending end voltage
Is = C * Vr + D * Ir;   % Sending end current

Ss = abs(Vs * Is)       % Sending end power in MVA

% Calculating voltage regulation

R = ((abs(Vs) - Vr)/Vr) * 100 % Voltage regulation