% To write a MATLAB program to determine line currents to a Y-connected 
% load by mesh analysis and by using symmetrical components.

% 17BEE012 - Alisamar Husain

Vp = 120;       % 3-phase Supply Voltage

Zs = 1j*12;     % Branch series reactance
Zm = 1j*4;      % Branch mutual reactance

% 1. Line currents by mesh analysis
disp('1. Line currents by mesh analysis')
Vl=sqrt(3)*Vp;

Z = [ (Zs-Zm) -(Zs-Zm) 0
      0 (Zs-Zm) -(Zs-Zm)
      1 1 1];

V = [ Vl*(cos(pi/6) + 1j*sin(pi/6))
      Vl*(cos(-pi/2) + 1j*sin(-pi/2))
      0];

Iabc = Z \ V;
disp(Iabc)

% 2. Line currents by symmetric components
disp('2. Line currents by symmetric components')
a = cos(2*pi/3)+ 1j*sin(2*pi/3);

A = [ 1 1 1; 
      1 a^2 a; 
      1 a a^2];
  
Z012 = [  Zs+2*Zm 0 0
          0 Zs-Zm 0
          0 0 Zs-Zm];

V012 = [0; Vp; 0];
I012 = Z012 \ V012;

Iabc = A * I012;
disp(Iabc)