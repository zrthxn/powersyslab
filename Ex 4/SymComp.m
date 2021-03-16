% Receiving end voltage, power and voltage regulation of
% 3-phase medium transmission line.

% 17BEE012 - Alisamar Husain

Vs = 120;     % Sending voltage in kV
Ss = 17.12;   % Sending power in MVA

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

Is = Ss / Vs;           % Sending current

Rc = T \ [Vs;Is];
Vr = Rc(1)              % Received voltage
Ir = Rc(2);             % Received current

Sr = abs(Vr * Ir)       % Received power in MVA

% Calculating voltage regulation

R = ((Vs - abs(Vr))/abs(Vr)) * 100 % Voltage regulation