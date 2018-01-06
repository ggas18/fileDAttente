function [ N_t ] = clientspresentes(lambda,T )
% cette fonction illustre l'evolution du processus de renouvellement.
% ENTREE lambda: le parametre de la loi exponentielle
%        T: le temps final de la simulation

% SORTIE N_t evolution du nombre de clients dans la file.
figure()
title('Processus de renouvellement des arrivées')
xlabel('Temps')
ylabel('La taille de la file')
hold on
s=-log(rand())/lambda;
plot([0 s],[0 0], 'b');
plot([s s],[0 1], ':b');
i=2;
N_t=[0 s];
s=s-log(rand())/lambda;
while(s<T)
    N_t=[N_t s];
    % on trace les segments pour faire les paliers.
    plot([N_t(i) N_t(i)],[i-1 i], ':b');
    plot([N_t(i) N_t(i+1)],[i i], 'b')
    s=s-log(rand())/lambda;
    i=i+1;
end

