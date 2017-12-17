function [  ] = histogramme(lambda,N,cl)
% cette fonction prend en parametre le parametre d'une loi exponentielle
% et simule un N-uplet de composante iid de loi exponentielle de parametre
% lambda et trace l'histogrammme avec cl classes

% on simule le N-uplet iid
data = -log(rand(1,N))/lambda;
% pour obtenir les classes et les frequences dans les classes
[counts,binCenters] = hist(data,cl);
% on divise par N pour avoir les frequences
bar(binCenters, counts/N);
hold on;

% pour avoir la courbe theorique
x = binCenters;
% evaluation de la densite
theoreticalCurve =lambda*exp(-lambda*x);
% affichage sur le même graphique
plot(x, theoreticalCurve, 'ro-', 'LineWidth', 0.5);
end

