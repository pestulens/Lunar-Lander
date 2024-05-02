close all;clc;clear

F = 0.5;
Pc = 10*10^5;
Cf = 1.2579;
r = 1.4;
Tc = 298;
Ru = 8314.3;
Patm = 10^5;
R = Ru/28;



At = F/(Pc*Cf);
rt = sqrt(At/pi)*1000;
dt = 2*rt;
Tt = Tc*(1/(1+(0.5*r-0.5)));
vt = sqrt(r*Tt*R);
Pt = Pc*(1+(0.5*r-0.5))^(-r/(r-1)) ;
% thot = Pt/(R*Tt);
% dm = At*thot*vt;
dm = (r*Pc*At)*(2/2.4)^3/(sqrt(r*R*Tc))
Ft = dm*vt+(Pt-Patm)*At