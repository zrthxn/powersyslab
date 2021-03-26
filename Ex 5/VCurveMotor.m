% To construct the V-curve for a synchronous motor with varying  
% field excitation from leading to lagging power factor

% 17BEE012 - Alisamar Husain

If = (38:1:58) / 10;    % Field currents from 3.8 A to 5.8 A
Ia = zeros(1,21);       % Armature currents to be calculated

Xs = 2.5;               % Synchronous reactance

Vp = 210;
delta1 = -12 * (pi/180);

Ea1 = 200 * (cos(delta1) + 1j*sin(delta1));

% Calculate armature current for each value
for i = (1:21)
    Ea2= 45.5 * If(i);
    
    delta2 = asin( (Ea1/Ea2) * sin(delta1) );
    Ea2 = Ea2 * (cos(delta2) + 1j*sin(delta2));
    
    Ia(i) = (Vp - Ea2) / (1j * Xs);
end

figure(1);
plot(If, abs(Ia), 'Color', 'k', 'LineWidth', 2.0);
xlabel('Field Current');
ylabel('Armature Current');
grid on;