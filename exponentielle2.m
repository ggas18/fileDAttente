function [ y ] = exponentielle2( lambda,n)
% cette fonction prend en parametre un reel et simule n-uplet de variables
% iid de loi exponentielle de parametre 
% lambda.
y=-log(rand(n,1))/lambda;
end

