close all;clc;clear

F = 0.5;
Pc = 10*10^5;
Cf = 1.2579;
r = 1.3975;
Tc = 298;
Ru = 8.3143;
Patm = 10^5;
R = Ru/(28*10^-3);

% radius = ((3.175-2.4)/2)*10^-3;
% radius = 0.5*(0.125-0.035*2)*25.4*10^-3;
radius = 0.4*10^-3;
A = pi*(radius^2);
% At = F/(Pc*Cf);
% rt = sqrt(At/pi)*1000;
% dt = 2*rt;
% Tt = Tc*(1/(1+(0.5*r-0.5)));
% vt = sqrt(r*Tt*R);
% Pt = Pc*(1+(0.5*r-0.5))^(-r/(r-1)) ;
% thot = Pt/(R*Tt);
% dm = At*thot*vt;
% dm_theory = (r*Pc*At)*(2/2.4)^3/(sqrt(r*R*Tc))
% dm_1 = (r*Pc*A)*(2/2.4)^3/(sqrt(r*R*Tc))
dm_1 = (Pc*A/sqrt(Tc))*sqrt(r/R)*(0.5*r+0.5)^((-r-1)/(2*r-2))
F = 546.5*dm_1
% Ft_th = dm_theory*vt+(Pt-Patm)*At
% Ft_1 = dm_1*vt+(Pt-Patm)*A

%% volume 
V_g = 0.00029652628*2; %volume of gas tank in m3
V_p = 0.00113252076;  %volume of pressurize tank in m3
d_N2_40 = 44.634; %density of n2 in 40 bar(kg/m3)
d_N2_10 = 11.142;%density of n2 in 10 bar(kg/m3)
m = 2*V_g*d_N2_10 +V_p*d_N2_40;
m_res = d_N2_10*V_p;
m_t = m-m_res;
totaltime = m_t/dm_1;
averagetime = totaltime/4;

%% nozzle desgin
expansion_ratio = 3.3;
radius = 0.4
r_e = radius*(expansion_ratio^0.5)
r_in = 0.5*(0.125-0.035*2)*25.4
L_D = (r_e-radius)/tand(15)
L_C = (r_in-radius)/tand(60)
L = L_C+L_D1.4