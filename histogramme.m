function [] = histogramme(lambda,N,cl)
% cette fonction prend en parametre le parametre d'une loi exponentielle
% et simule un N-uplet de composante iid de loi exponentielle de parametre
% lambda et trace l'histogrammme avec cl classes

% ENTREE: lambda le parametre de loi exponentielle
%         N la taille de l'echantillon
%         cl le nombre de classses

% SORTIE: on ne retourne rien.

% on simule le N-uplet iid
data = -log(rand(1,N))/lambda;
% pour obtenir les classes et les frequences dans les classes
[counts,binCenters] = hist(data,cl);
% on divise par N pour avoir les frequences et on trace l'histogramme
bar(binCenters, counts/N);
hold on;

% pour avoir la courbe theorique
x = binCenters;
% evaluation de la densite
theoreticalCurve =lambda*exp(-lambda*x);
% affichage sur le même graphique
plot(x, theoreticalCurve, 'ro-', 'LineWidth', 0.5);
title('histogramme et densité théorique')
end

