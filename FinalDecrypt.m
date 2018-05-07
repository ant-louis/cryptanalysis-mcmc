clc;
clear;
load('Q.mat');
load('pinit.mat');
symbols;

Tcrypte = fileread('Crypted.txt');
[prob_post, best_x] = Metropolis(Tcrypte,pinit,Q);
T_chap = decrypt(Tcrypte,best_x);

%Affichage des résulats
fprintf('\n********************RESULTATS**************************\n');
fprintf('Code de chiffrement trouve= %s\n', best_x);
fprintf('Texte decrypte= %s\n',  T_chap);
