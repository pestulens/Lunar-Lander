%% Nonlinear Control HW6_4
clc;
clear;
close all;

%%
dt=0.01;
t_final=4;
t=0:dt:t_final;
LW1=1.6;
FS1=16;
FS_lg=11;

%%
f1 = figure;
x1=[1;2;4]; x2=[2;-3;-5]; x3=[-0.5;-3;-9]; x4=[0;-2;-3]; x5=[4;-6;-6];
x6=[5;7;5]; x7=[6;8;-4]; x8=[7;9;3]; x9=[8;10;-2]; x10=[9;11;1];
x_arb_re1=[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];
ColorCode=[0,0.15,0.39; 0,0.3,0.8 ; 0,0.39,0.7 ; 0,0.47,0.51 ; 0,0.47,0.39 ; 0,0.55,0.35 ; 0,0.63,0.35 ; 0,0.75,0.6 ; 0,0.85,0.5 ; 0,0.95,0.4];
for i=1:length(x_arb_re1(1,:))
    [t,x1]=RK4(@(t,x1) Nonlinear_system(t, x1), [0 t_final], x_arb_re1(:,i), dt);
    x1_1=x1(:,1);
    x1_2=x1(:,2);
    x1_3=x1(:,3);
    for j=1:length(t)
        u1(j)=(1/(-1- x1_1(j)))*(-( x1_1(j))^2-4* x1_1(j)-3*x1_2(j)-(x1_3(j))^2+7*x1_3(j)+3* x1_1(j)*x1_3(j)+x1_2(j)*x1_3(j));
    end
    u1_all(i,:)=u1;
    p1(i)=plot(t,u1, 'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
end
hs2(1)=legend([p1(1),p1(2),p1(3),p1(4),p1(5),p1(6),p1(7),p1(8),p1(9),p1(10)],...
                        {'$\mathbf{x}$(0)=(1,2,4)','$\mathbf{x}$(0)=(2,-3,-5)','$\mathbf{x}$(0)=(-0.5,-3,-9)',...
                         '$\mathbf{x}$(0)=(0,-2,-3)','$\mathbf{x}$(0)=(4,-6,-6)','$\mathbf{x}$(0)=(5,7,5)',...
                         '$\mathbf{x}$(0)=(6,8,-4)','$\mathbf{x}$(0)=(7,9,3)','$\mathbf{x}$(0)=(8,10,-2)',...
                         '$\mathbf{x}$(0)=(9,11,1)'},'Interpreter','latex');
ax2(1) = gca ;
xlabel('Time (sec)') 
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') 
axis normal
grid on

%%
f2 = figure;
x1=[-5;5;5]; x2=[5;-5;5]; x3=[5;5;-5]; x4=[-5;-5;5]; x5=[5;-5;-5];
x6=[-5;5;-5]; x7=[5;5;5]; x8=[-5;-5;-5]; x9=[4;1;6]; x10=[-8;4;3];
x_arb_re2=[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];
ColorCode=[0,0.15,0.39; 0,0.3,0.8 ; 0,0.39,0.7 ; 0,0.47,0.51 ; 0,0.47,0.39 ; 0,0.55,0.35 ; 0,0.63,0.35 ; 0,0.75,0.6 ; 0,0.85,0.5 ; 0,0.95,0.4];
for i=1:length(x_arb_re2(1,:))
    [t,x1]=RK4(@(t,x1) Nonlinear_system(t, x1), [0 t_final], x_arb_re2(:,i), dt);
    x2_1=x1(:,1);
    x2_2=x1(:,2);
    x2_3=x1(:,3);
    for j=1:length(t)
        u2(j)=(1/(-1- x2_1(j)))*(-( x2_1(j))^2-4* x2_1(j)-3*x2_2(j)-(x2_3(j))^2+7*x2_3(j)+3* x2_1(j)*x2_3(j)+x2_2(j)*x2_3(j));
%         if i==4 && j==250
%             x2_1(j)
%             x2_2(j)
%             x2_3(j)
%         end
    end
    u2_all(i,:)=u2;
    p2(i)=plot(t,u2, 'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
end
hs2(2)=legend([p2(1),p2(2),p2(3),p2(4),p2(5),p2(6),p2(7),p2(8),p2(9),p2(10)],{'$\mathbf{x}$(0)=(-5,5,5)','$\mathbf{x}$(0)=(5,-5,5)','$\mathbf{x}$(0)=(5,5,-5)','$\mathbf{x}$(0)=(-5,-5,5)','$\mathbf{x}$(0)=(5,-5,-5)','$\mathbf{x}$(0)=(-5,5,-5)','$\mathbf{x}$(0)=(5,5,5)','$\mathbf{x}$(0)=(-5,-5,-5)','$\mathbf{x}$(0)=(4,1,6)','$\mathbf{x}$(0)=(-8,4,3)'},'Interpreter','latex');
ax2(2) = gca ;
xlabel('Time (sec)') 
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') 
axis normal
grid on

%%
f3 = figure;
x1=[-0.01;0.01;0.1]; x2=[0.01;-0.01;0.01]; x3=[0.01;0.01;-0.01]; x4=[-0.01;-0.01;0.01]; x5=[-0.01;0.01;-0.01];
x6=[0.01;-0.01;-0.01]; x7=[0.01;0.01;0.01]; x8=[-0.01;-0.01;-0.01]; x9=[0.001;0.001;0.001]; x10=[-0.001;-0.001;-0.001];
x_arb_re3=[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];
ColorCode=[0,0.15,0.39; 0,0.3,0.8 ; 0,0.39,0.7 ; 0,0.47,0.51 ; 0,0.47,0.39 ; 0,0.55,0.35 ; 0,0.63,0.35 ; 0,0.75,0.6 ; 0,0.85,0.5 ; 0,0.95,0.4];
for i=1:length(x_arb_re3(1,:))
    [t,x1]=RK4(@(t,x1) Nonlinear_system(t, x1), [0 t_final], x_arb_re3(:,i), dt);
    x3_1=x1(:,1);
    x3_2=x1(:,2);
    x3_3=x1(:,3);
    for j=1:length(t)
        u3(j)=(1/(-1- x3_1(j)))*(-( x3_1(j))^2-4* x3_1(j)-3*x3_2(j)-(x3_3(j))^2+7*x3_3(j)+3* x3_1(j)*x3_3(j)+x3_2(j)*x3_3(j));
    end
    u3_all(i,:)=u3;
    p3(i)=plot(t,u3, 'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
end
hs2(3)=legend([p3(1),p3(2),p3(3),p3(4),p3(5),p3(6),p3(7),p3(8),p3(9),p3(10)],...
                        {'$\mathbf{x}$(0)=(-0.01,0.01,0.01)','$\mathbf{x}$(0)=(0.01,-0.01,0.01)','$\mathbf{x}$(0)=(0.01,0.01,-0.01)',...
                         '$\mathbf{x}$(0)=(-0.01,-0.01,0.01)','$\mathbf{x}$(0)=(-0.01,0.01,-0.01)','$\mathbf{x}$(0)=(0.01,-0.01,-0.01)',...
                         '$\mathbf{x}$(0)=(0.01,0.01,0.01)','$\mathbf{x}$(0)=(-0.01,-0.01,-0.01)','$\mathbf{x}$(0)=(0.001,0.001,0.001)',...
                         '$\mathbf{x}$(0)=(-0.001,-0.001,-0.001)'},'Interpreter','latex');
ax2(3) = gca ;
xlabel('Time (sec)') 
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') 
axis normal
grid on

%%
f4 = figure;
x1=[100;100;100]; x2=[-100;100;100]; x3=[100;-100;100]; x4=[100;100;-100]; x5=[-100;-100;100];
x6=[-100;100;-100]; x7=[100;-100;-100]; x8=[-100;-100;-100]; x9=[1000;1000;1000]; x10=[-1000;-1000;-1000];
x_arb_re4=[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];
ColorCode=[0,0.15,0.39; 0,0.3,0.8 ; 0,0.39,0.7 ; 0,0.47,0.51 ; 0,0.47,0.39 ; 0,0.55,0.35 ; 0,0.63,0.35 ; 0,0.75,0.6 ; 0,0.85,0.5 ; 0,0.95,0.4];
for i=1:length(x_arb_re4(1,:))
    [t,x1]=RK4(@(t,x1) Nonlinear_system(t, x1), [0 t_final], x_arb_re4(:,i), dt);
    x4_1=x1(:,1);
    x4_2=x1(:,2);
    x4_3=x1(:,3);
    for j=1:length(t)
        u4(j)=(1/(-1- x4_1(j)))*(-( x4_1(j))^2-4* x4_1(j)-3*x4_2(j)-(x4_3(j))^2+7*x4_3(j)+3* x4_1(j)*x4_3(j)+x4_2(j)*x4_3(j));
        if i==9 && j==11
            x4_1(j)
            x4_2(j)
            x4_3(j)
        end
    end
    u4_all(i,:)=u4;
    p4(i)=plot(t,u4, 'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
end
hs2(4)=legend([p4(1),p4(2),p4(3),p4(4),p4(5),p4(6),p4(7),p4(8),p4(9),p4(10)],...
                        {'$\mathbf{x}$(0)=(100,100,100)','$\mathbf{x}$(0)=(-100,100,100)','$\mathbf{x}$(0)=(100,-100,100)',...
                         '$\mathbf{x}$(0)=(100,100,-100)','$\mathbf{x}$(0)=(-100,-100,100)','$\mathbf{x}$(0)=(-100,100,-100)',...
                         '$\mathbf{x}$(0)=(100,-100,-100)','$\mathbf{x}$(0)=(-100,-100,-100)','$\mathbf{x}$(0)=(1000,1000,1000)',...
                         '$\mathbf{x}$(0)=(-1000,-1000,-1000)'},'Interpreter','latex');
ax2(4) = gca ;
xlabel('Time (sec)') 
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') 
axis normal
grid on
u5=u4_all';

%%
for i = 1:length(ax2) 
    set(ax2(i),'FontSize',FS1,'FontName','Times New Roman') 
end 
for i = 1:length(hs2)
    set(hs2(i),'FontSize',FS_lg,'FontName','Times New Roman')
end

%%
function dX=Nonlinear_system(t,x)
u=(1/(-1-x(1)))*(-(x(1))^2-4*x(1)-3*x(2)-(x(3))^2+7*x(3)+3*x(1)*x(3)+x(2)*x(3));
dX=zeros(3,1);
dX(1)=-x(1)+x(2)-x(3);
dX(2)=-x(1)*x(3)-x(2)+u;
dX(3)=-x(1)+u;
end