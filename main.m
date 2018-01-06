clc, close all
% lambda=2e-1;
% mu=1.5e-1;
% N=100000;
% T=1000;
% cl=10;
% test de exponentielle1
% y1=exponentielle1(lambda);

% test de exponentielle2
% y2=exponentielle2(lambda,N);
% histogramme(1,N,cl);
% [donnees_arr,donnees_serv]=donnees(lambda,mu,T);
% N_t=clientspresentes(lambda,T);

% Et=clientsrestants(lambda,mu,T);

lambda=2e-1;
mu=3e-1;
Nsim=10000;
% p=lambda/(lambda+mu);
% V=0;
% for j=2:Nsim
%     V=[V suivant(p,V(j-1))];
% end

illustration(lambda,mu,Nsim)