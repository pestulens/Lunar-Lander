function [G,H,C,D,Lo,Singu,Vn,Sn] = Auxi_OKID_JXL(ID_u,ID_y,q,Mult_Num,D_exist)

[m,u_l] = size(ID_u);
[p,y_1] = size(ID_y);

Check_q = exist('q');
if (Check_q == 0 | q == 0)
 q = 1;
end

Check_Mult_Num = exist('Mult_Num');
if (Check_Mult_Num == 0 | Mult_Num == 0)
    Mult_Num = 2;
end


Check_D_exist = exist('D_exist');
if (Check_D_exist == 0 | D_exist == 0)
    D_exist = 0;
end


v_bar = [ID_u; ID_y];
V_bar = [];
for i = 1:q
    V_bar = [v_bar(:,i:end-((q+1)-i)); V_bar];
end

y_bar = ID_y(:,q+1:end);
if (D_exist == 0)
    Y_bar = y_bar*pinv(V_bar);
    D = zeros(p,m);
    Y_bar = [D,Y_bar];
else
    V_bar = [ID_u(:,q+1:end); V_bar];
    Y_bar = y_bar*pinv(V_bar);
    D = Y_bar(:,1:m);
end
Y_bar(:,1:m) = [];

for i = 1:q
    Y_bar_1(:,:,i) = Y_bar(:,(i-1)*(p+m)+1:(i-1)*(p+m)+m);
    Y_bar_2(:,:,i) = -Y_bar(:,(i-1)*(p+m)+(m+1):(i-1)*(p+m)+(m+p));
end


Y(:,:,1) = D;
for k = 1:2*(Mult_Num+1)
    Left_temp = []; Right_temp = []; Sum_temp = [];
    if (k <= q)
        for j = 1:k
            Left_temp = [Left_temp Y_bar_2(:,:,j)];
            Right_temp = [Y(:,:,j); Right_temp];
        end
    Sum_temp = Left_temp*Right_temp;
    Y(:,:,k+1) = Y_bar_1(:,:,k)-Sum_temp;
    else
        for j = 1:q
            Left_temp = [Left_temp Y_bar_2(:,:,j)];
            Right_temp = [Right_temp; Y(:,:,k-j+1)];
        end
    Sum_temp = Left_temp*Right_temp;
    Y(:,:,k+1) = -Sum_temp;
    end
end

Y(:,:,1) = [];
Y_o(:,:,1) = Y_bar_2(:,:,1);
for k = 2:2*(Mult_Num+1)
    Left_temp = []; Right_temp = []; Sum_temp = [];
    if (k <= q)
        for j = 1:(k-1)
            Left_temp = [Left_temp Y_bar_2(:,:,j)];
            Right_temp = [Y_o(:,:,j); Right_temp];
        end
        Sum_temp = Left_temp*Right_temp;
        Y_o(:,:,k) = Y_bar_2(:,:,k)-Sum_temp;
    else
         for j = 1:q
            Left_temp = [Left_temp Y_bar_2(:,:,j)];
            Right_temp = [Right_temp; Y_o(:,:,k-j)];
         end
         Sum_temp = Left_temp*Right_temp;
         Y_o(:,:,k) = -Sum_temp;
    end
end
H_bar = [];
for i = 1:Mult_Num+1
    H_bar_temp = [];
    for j = 1:Mult_Num+2
        temp = [Y(:,:,(i-1)+j) Y_o(:,:,(i-1)+j)];
        H_bar_temp = [H_bar_temp temp];
    end
    H_bar = [H_bar; H_bar_temp];
end
H_bar_0 = H_bar(:,1:(p+m)*(Mult_Num+1));
H_bar_1 = H_bar(:,(p+m)+1:end);

[V,Singu,S] = svd(H_bar_0);
n_min = q*p;
Vn = V(:,1:n_min);
Sn = S(:,1:n_min);
Singun = [Singu(1:n_min,1:n_min)];
Singu_Value = diag(Singu);
disp("Singular value = "+ Singu_Value)
G = (Singun^-0.5)*Vn'*H_bar_1*Sn*(Singun^-0.5);
InputMatrix_temp = (Singun^0.5)*Sn';
H = InputMatrix_temp(:,1:m);
Lo = InputMatrix_temp(:,(m+1):(m+p));
OutputMatrix_temp = Vn*(Singun^0.5);
C = OutputMatrix_temp(1:p,:);

