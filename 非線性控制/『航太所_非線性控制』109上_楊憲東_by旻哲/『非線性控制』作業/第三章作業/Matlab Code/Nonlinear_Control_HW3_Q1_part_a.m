%% Nonlinear Control HW3 - Q1 - (a)
clc ; clear ; close all
K = 150 ;
num=[K];
den1=conv([0.1 1],[0.02 1]);
den=conv([1 0],den1);
sys=tf(num,den);
[re,im,we]=nyquist(sys);
for i =1: length(re)
    G_re(i) = re(:,:,i) ;
    G_im(i) = im(:,:,i) ;
end

X = 20 : 0.1 :270 ;
for i = 1:length(X)
    N_X(i) = 2/pi*( asin(20/X(i)) + 20/X(i)*( 1-400/(X(i)^2) )^(1/2) ) ;
end
N_X_inv = 1./N_X ;

func_N_X_c = @(Xc) -2.5*(2/pi*( asin(20/Xc) + 20/Xc*( 1-400/(Xc^2) )^(1/2) ))+1 ;
Xc = fsolve(func_N_X_c,51)

FS_ax = 16 ;
LW_1 = 1.35 ;
figure
plot(G_re,G_im,'b','LineWidth',LW_1)
hold on 
quiver(G_re,G_im,gradient(G_re),gradient(G_im),2,'b','LineWidth',LW_1,'MaxHeadSize',100)
hold on
plot(G_re,-G_im,'b','LineWidth',LW_1)
quiver(G_re,-G_im,-gradient(G_re),gradient(G_im),2,'b','LineWidth',LW_1,'MaxHeadSize',100)
% plot([-0.15 0.05],[0 0],'-.k')
% plot([0 0],[-0.09 0.09],'-.k')
plot([-11 5],[0 0],'-.k')
plot([0 0],[-7 7],'-.k')
plot(-N_X_inv,zeros(length(N_X_inv)),'-r','LineWidth',LW_1)
annotation( 'arrow' ,[ 0.248 0.195 ],[0.53 0.53] , 'Color' , 'r' );
text(-1.4,-1,'-1','FontSize',16,'FontName','Times New Roman')
text(-7,-4.6,'$KG(j\omega)$','Interpreter','latex','FontSize',15,'Color','b')
text(-3.4,2.2,'-2.5','FontSize',16,'FontName','Times New Roman')
text(-2.79,0.95,'$\downarrow$','Interpreter','latex','FontSize',20,'Color','K')
% text(-0.03,0.023,'$\omega = \omega_0 = 22.3607 $','Interpreter','latex','FontSize',15,'Color','b')
% text(-0.02,0.01,'$\downarrow$','Interpreter','latex','FontSize',20,'Color','b')
text(-9.5,-1.2,'$-\frac{1}{N(X)}$','Interpreter','latex','FontSize',18,'Color','r')
grid on
% axis
axis equal
ax(1) = gca ;
% ax(1).XLim = [-0.13 0.05];
% ax(1).YLim = [-0.08 0.081];
ax(1).XLim = [-11 5];
ax(1).YLim = [-7 7];
% label
xlabel('Real')
ylabel('Image')
% title
%title('$K =K_1 = 150$','Interpreter','latex')

for i = 1:length(ax)
    set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman')
end