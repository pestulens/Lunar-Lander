close all;clc;clear


out = sim("lunar_lander_sim_PWPF_2023a.slx");
%% data process
 close
t_sim       = out.simout.Time;
response    = out.simout.Data;

for i =1:3
    plot(t_sim,response(:,i),'LineWidth',2)
    hold on 
    xlabel("Time(s)")
    ylabel("Attitude(degree)")
    title("Moon Lander Attitude Response","FontSize",16)

end
lgd = legend("\phi ","\theta ","\psi ");
fontsize(lgd,9,'points')