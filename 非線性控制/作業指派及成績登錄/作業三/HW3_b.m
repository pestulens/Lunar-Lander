%% Nolinear Control HW3_b
clc;
clear;
close all;

%%
FS_ax = 16 ;
LW_1 = 1.35 ;

%%
figure (1)
K = 100;
num=[K];
den1=conv([0.1 1],[0.02 1]);
den=conv([1 0],den1);
sys=tf(num,den);
[re,im,we]=nyquist(sys);
for i =1: length(re)
 G_re(i) = re(:,:,i) ;
 G_im(i) = im(:,:,i) ;
end
X = 20 : 0.1 :270;
for i = 1:length(X)
 N_X(i) = 2/pi*( asin(20/X(i)) + 20/X(i)*( 1-400/(X(i)^2) )^(1/2));
end
N_X_inv = 1./N_X ;
plot(-N_X_inv,zeros(length(N_X_inv)),'-r','LineWidth',LW_1)
hold on
plot(G_re,G_im,'b','LineWidth',LW_1)
hold on 
quiver(G_re,G_im,gradient(G_re),gradient(G_im),2,'b','LineWidth',LW_1)
hold on
plot(G_re,-G_im,'b','LineWidth',LW_1)
hold on
quiver(G_re,-G_im,-gradient(G_re),gradient(G_im),2,'b','LineWidth',LW_1,'MaxHeadSize',100)
hold on
plot(-N_X_inv(1),0,'ro')
annotation( 'arrow' ,[ 0.248 0.195 ],[0.53 0.53] , 'Color' , 'r' );
plot([-6 3],[0 0],'-k')
plot([0 0],[-4 4],'-k')
axis equal
ax(1) = gca ;
set(ax(1), 'XLim',  [-6 3], 'YLim', [-4 4],'xtick', [-6:1:3], 'ytick', [-4:1:4])
xlabel('Real')
ylabel('Image')
text(-3,-2.5,'$KG(j\omega)$','Interpreter','latex','FontSize',15,'Color','b')
text(-6,-1,'$-\frac{1}{N(X)}$','Interpreter','latex','FontSize',18,'Color','r')
text(-2.5,1,'-1.6667','FontSize',16,'FontName','Times New Roman')
text(-1.8,0.5,'$\downarrow$','Interpreter','latex','FontSize',20,'Color','K')
title('$K=K_1=100$', 'interpreter', 'latex')
grid on

%%
for i = 1:length(ax)
 set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman')
end

%% Calculate the X
func_N_X_c = @(Xc) -1.6667*(2/pi*( asin(20/Xc) + 20/Xc*( 1-400/(Xc^2) )^(1/2) ))+1 ;
Xc = fsolve(func_N_X_c,40)