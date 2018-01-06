function [ v_suiv] = suivant(p,i)
% cette simule l'etat suivant dans la chaine de Markov Vn a partir de letat
% i.
% ENTREE p: proba que Vn augmente de 1
%        i: l'etat actuel

% SORTIE v_suiv: l'etat de suivant Vn.

% si i vaut 0 alors l'etat suivant est 1
if(i==0) 
    v_suiv=1;
% si i >0 alors l'etat suivant est soit i+1 avec proba p et i-1 avec proba
% 1-p
else
    % on simule une loi uniforme, 
    u=rand();
    % si on est en dessous de p alors l'etat suivant est i+1
    if(u<p)
        v_suiv=i+1;
    % si on est en dessous de p alors l'etat  suivant est i-1
    else
        v_suiv=i-1;
    end
end
end

