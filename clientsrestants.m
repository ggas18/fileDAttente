function [ Etat ] = clientsrestants(lambda,mu,T )
% cette fonction prend les parametres de lois et retourne un vecteur 
% des instants de sauts du nombre de client restant.

% ENTREE lambda: parametre de la loi des instants d'arrivee
%        mu: parametre de la loi des durees des services
%        T:  instant terminal de la simulation

% SORTIE Etat: le vecteurs des instants des sauts et les valeurs correpson-
%               dantes.

% on utilise la fonction donnees pour avoir les instants d'arrivees et les 
% durees des services.
[inst_arr, dur_serv]=donnees(lambda,mu,T);

% on recherche les instants des sauts du processus de renouvemment des
% clients servis.
instServ=0;n=1;
while((instServ(end)<T) && (n<=max(size(inst_arr))))
    inst_suiv=max(instServ(end)+dur_serv(n),inst_arr(n));
    % en calcul les instants de services de proche en proche en 
    % utilisant la question I-1 b)       
    instServ=[instServ inst_suiv];
    n=n+1;
end
% on enleve le zero initial des instants des services
instServFini=instServ(2:end)+dur_serv(1,size(instServ,2)-1);
N_P=max(size(inst_arr));
N_S=max(size(instServ));

% On va parcourir les instants de saut du processus d'arrivées et des
% instants de sauts de processus de service. Si on arrive à un instant de 
% saut du processus d'arrivee alors on ajoute sinon si on arrive à un
% instant de saut du processus de service on enlève 1 dans la valeur
% actuelle de la file.
s=1;p=1;
% initialement la file est vide
Etat=[0;0];
% on parcours les instants de sauts dans les deux listes dans l'ordre
% croissant.
while(s<=N_S && p<=N_P)
    % si on arrive sur un saut des arrivees on memorise l'instant et on
    % ajoute +1 à la valeur actuelle de la taille de la file.
    if(inst_arr(p)<instServFini(s))
        Etat=[Etat [inst_arr(p);Etat(end,end)+1]];
        p=p+1;
    % si on arrive sur un saut des services on memorise l'instant de 
    % services et on ajoute +1 à la valeur actuelle de la taille de la file.
    elseif(inst_arr(p)>instServFini(s))
        Etat=[Etat [instServFini(s);Etat(end,end)-1]];
        s=s+1;
    end
end


% N le nombre de points de saut dans le processus des clients restants
figure()
title('Nombre de clients restants dans la file')
xlabel('Temps')
ylabel('La taille de la file')
hold on
N=size(Etat,2);
for i=2:N-1
    plot([Etat(1,i-1),Etat(1,i)],[Etat(2,i-1),Etat(2,i-1)],'b')
    plot([Etat(1,i),Etat(1,i)],[Etat(2,i-1),Etat(2,i)],':b')
end

plot([Etat(1,N-1),Etat(1,N)],[Etat(2,N-1),Etat(2,N-1)],'b')
end
