function [arr,serv ] = donnees(lambda,mu,T )
% cette fonction prend les parametres lambda et mu des lois exponentielles
% des temps inter-arrivees et des temps de service et rend en sortie deux
% vecteurs.
% ENTREE lambda: parametre de la loi des inter-arrivees
%        mu: parametre de la loi des services
%        T: temps final
% SORTIE arr: les instants des arrivees
%        serv: les durees de services.
s=0;
arr=[];
serv=[];
while(s<=T)
    s=s-log(rand())/lambda;
    if(s<T)
        arr=[arr s];
        serv=[serv -log(rand())/mu];
    end
end
end

