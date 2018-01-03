clc, close all
lambda=1e-1;
mu=2*1e-1;
N=100000;
T=100;
cl=10;
% test de exponentielle1
%y1=exponentielle1(lambda);

% test de exponentielle2
%y2=exponentielle2(lambda,N);
%histogramme(1,N,cl);
%[donnees_arr,donnees_serv]=donnees(lambda,mu,T);
%N_t=clientspresentes(lambda,T);

clc, close all
lambda=1e-1;
mu=1e-2;
T=1000;
clientsrestants(lambda,mu,T);
