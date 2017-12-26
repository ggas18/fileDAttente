function [ N_t ] = clientspresentes(lambda,T )
% cette fonction illustre l'evolution du processus de renouvellement.
% ENTREE lambda: le parametre de la loi exponentielle
%        T: le temps final de la simulation

% SORTIE N_t evolution du nombre de clients dans la file.
s=-log(rand())/lambda;
i=0;
figure()
title('Processus de renouvellement des arrivées')
xlabel('Temps')
ylabel('La taille de la file')
hold on
N_t=s;
plot([0 s],[i i], 'b')
i=i+1;
while(s<T)
    s=s-log(rand())/lambda;
    N_t=[N_t s];
    % on trace les segments pour faire les paliers.
    plot([N_t(i) N_t(i)],[i-1 i], ':b');
    plot([N_t(i) N_t(i+1)],[i i], 'b')
    i=i+1;
end

