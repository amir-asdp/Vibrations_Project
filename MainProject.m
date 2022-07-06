clc
clear all
close all

%% Data
rho = 2700;
E = 72*10^9;
v = 0.289;
L = 1.8;
b = 0.2;
a = 0.05;
I = 1/12*b*(a^3);

K_eff = 3*E*I/(L^3);
m_b = a*b*L*rho;
M_eff = 0.2357*m_b;
w_11 = sqrt(K_eff/M_eff);
w_excit = w_11;

k_e = 10^5;
m_e = k_e/(w_excit^2);
w_22 = sqrt(k_e/m_e);

F0 = 200;
X1 = (F0/K_eff)*((1-(w_excit/w_22)^2)/((1+k_e/K_eff-(w_excit/w_11)^2)*(1-(w_excit/w_22)^2)-k_e/K_eff));
X2 = -F0/(m_e*(w_excit)^2);

%% Functions
X1_func = @(w) (F0/K_eff)*((1-(w/w_22)^2)/((1+k_e/K_eff-(w/w_11)^2)*(1-(w/w_22)^2)-k_e/K_eff));
x1 = @(t) X1*sin(w_excit*t);
x2 = @(t) X2*sin(w_excit*t);

%% Result & Plot
X1_mat = zeros();
x1_mat = zeros();
x2_mat = zeros();
n = 1;
m = 1;

for W = 0:0.01:200
    X1_mat(n)= X1_func(W);
    n = n+1;
end

for T=0:0.001:1
    x1_mat(m) = x1(T);
    x2_mat(m) = x2(T);
    m = m+1;
end

w = 0:0.01:200;
t = 0:0.001:1;
figure(1);plot(w, X1_mat,'.g')
xlabel('w (rad/second)'); ylabel('X1 (meter)'); title('Amp - Freq Plot');

figure(2);plot(t, x1_mat,'.r',t, x2_mat,'.b')
xlabel('t (second)'); ylabel('x_1 , x_2 (meter)');legend('x_1','x_2'); title('x - t Plot');


