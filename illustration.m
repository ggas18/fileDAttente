function [ ] = illustration( lambda,mu,Nsim)
% cette fonction permet d'illustrer le comportement de la chaine
% de markov

% ENTREE lambda: parametre de la loi exponentielle des arrivees
%        mu: parametre de la loi exponentielle des services
%        Nsim: la taille de la trajectoire

% SORTIE: rien

p=lambda/(lambda+mu);

% les etats de la chaine
V=zeros(Nsim,1);
% les instants de sauts
T=zeros(Nsim,1);

S1=zeros(Nsim,1);
S2=zeros(Nsim,1);
% on simule Nsim fois
for j=2:Nsim
    % on utilise la fonction suivante pour avoir l'etat prochain
    V(j)=suivant(p,V(j-1));
    
    S1(j)=S1(j-1)+V(j);
    S2(j)=S2(j-1)+(V(j)==0);
    % pour avoir l'instant de saut suivant on test si on est dans letat 0
    if(V(j-1)==0)
        % si oui l'instant du prochain evenement suit une loi exponentielle 
        % de parametre lambda
        T(j)=T(j-1)-log(rand())/lambda;
    else
        % si non l'instant du prochain evenement suit une loi exponentielle 
        % de parametre lambda+mu
        T(j)=T(j-1)-log(rand())/(lambda+mu);
    end
end

S1=S1/Nsim;
S2=S2/Nsim;

figure()
hold on
% tracer du processus de markov
plot([T(1) T(2)],[V(1) V(1)],'b');

plot([T(1) T(2)],[S1(1) S1(1)],'g');

plot([T(1) T(2)],[S2(1) S2(1)],'m');

for i=2:Nsim-1
    plot([T(i) T(i)],[V(i-1) V(i)],':b');
    plot([T(i) T(i+1)],[V(i) V(i)],'b');
    
    plot([T(i) T(i)],[S1(i-1) S1(i)],':g');
    plot([T(i) T(i+1)],[S1(i) S1(i)],'g');
    
    plot([T(i) T(i)],[S1(i-1) S1(i)],':g');
    plot([T(i) T(i+1)],[S1(i) S1(i)],'g');
end


end

