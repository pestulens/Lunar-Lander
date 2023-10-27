close all

x(1:3,:) = out.phi_theta_psi.Data';
x_d(1:3,:) = out.phi_theta_psi_dot.Data';
figure(1)
plot(x(1,:),x_d(1,:))

figure(2)
plot(x(2,:),x_d(2,:))

figure(3)
plot(x(3,:),x_d(3,:))