%Script de test de l'algorithme en fonction de textes de longueurs
%differentes

clc;
clear;
load('Q.mat');
load('pinit.mat');
symbols;

T = ' ... ';%Plusieurs textes testes
key = symb(randperm(length(symb)));
Tcrypte = encrypt(T,key);
[probPost, best_key] = Metropolis(Tcrypte,pinit,Q);
Tdecrypt = decrypt(Tcrypte,best_key);

%Affichage des resulats a la console
fprintf('\n********************RESULTATS**************************\n');
fprintf('Code de chiffrement trouve= %s\n', best_key);
fprintf('Code de chiffrement attendu= %s\n', key);
fprintf('Texte decrypte= %s\n',  Tdecrypt);
fprintf('Texte original= %s\n', T);

%Graphique des prob a posteriori en fonction de l'iteration
plot(probPost);
xlabel('Iteration');
ylabel('Probabilite a posteriori');
title('Probabilite a posteriori/Iteration');




