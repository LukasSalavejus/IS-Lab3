% Intelektualiosios sistemos
% 3 LD
% Lukas Salavejus MNEfm21

clear all; close all; clc;
% input
x = [0.1:1/22:1];
% output
y = ((1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x))/2;

% Pradines reiksmes
c1 = randn(1);
c2 = randn(1);
r1 = randn(1);
r2 = randn(1);
w1 = randn(1);
w2 = randn(1);
b1 = randn(1);

% Spindulio tipo funkcijos
F1 = exp(-(x-c1).^2./(2*r1^2));
F2 = exp(-(x-c2).^2./(2*r2^2));

% Pasvertoji suma
v = w1.*F1+w2.*F2+b1;

% Klaidos
e = y - v;
e_total = sum(abs(e));

% Pradine funkcija vs spejama funkcija pries mokyma
subplot(2,1,1);
plot(x,y,'-r');
hold on;
plot(x,v,'-b');
title('Pradine funkcija vs spejama funkcija pries mokyma');
grid on;

% Nustatoma max leidziama klaida
% Norint gauti dar tikslesni rezultata, butu galima dar mazinti max_e
max_e = 0.1;

% Mokymo zingsnis
n = 0.05;

% Iteraciju skaicius
i = 0;

% Apmokymas
while(e_total > max_e)
    i = i+1;
    
    % Atnaujinami svoriai
    w1 = w1 + n * e .* F1;
    w2 = w2 + n * e .* F2;
    b1 = b1 + n * e * 1; % Tiesine aktyvavimo f-ja y=1
    
    % Pasvertoji suma
    v = w1.*F1+w2.*F2+b1;
    
    % Klaidos
    e = y - v;
    e_total = sum(abs(e));
end

% Pradine funkcija vs spejama funkcija po mokymo
subplot(2,1,2);
plot(x,y,'-r');
hold on;
plot(x,v,'-b');
title('Pradine funkcija vs spejama funkcija po mokymo');
grid on;

disp(['Mokymas atliktas per ',num2str(i),' iteracijas']);

