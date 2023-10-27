clc; clear; close all;

figure;
x = -100:100;
x1 = 0.01:0.01:100;
y1 = 0.5./x1;
% plot(x1,y1);
% hold on
x2 = -100:0.01:-0.01;
y2 = 0.5./x2;
% plot(x2,y2);
% hold on
patch([x1 fliplr(x2)], [y1 fliplr(y2)], 'b','facealpha',0.5)
grid on
axis equal
axis([-5,5,-5,5])
xlabel('x_1');
ylabel('x_2');
set(gca,'FontSize',14);