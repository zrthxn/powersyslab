% Equivalent pi-model and the transmission matrix for a 3-phase
% long transmission line.

% 17BEE012 - Alisamar Husain

Zp  = 0.017 + 0.12i; % Impedance per km
Yp  = 1.2i;          % Admittance per km
len = 200;           % Length in km

Z = len * Zp;
Y = len * Yp;

A = ((Y*Z)/2) + 1;
B = Z;
C = Y*(((Y*Z)/4) + 1);
D = A;

T = [ A B; C D; ]
