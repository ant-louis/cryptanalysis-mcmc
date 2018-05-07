clc;
clear;
load('Q.mat');
load('pinit.mat');
symbols;

%**********************TEST SELF-MADE TEXT*********************************
T = 'The news that a wealthy young gentleman named Charles Bingley has rented the manor known as Netherfield Park causes a great stir in the neighboring village of Longbourn';
y = symb(randperm(length(symb)));
Tcrypte = encrypt(T,y);
[prob_post, best_x] = Metropolis(Tcrypte,pinit,Q);
T_chap = decrypt(Tcrypte,best_x);
%Affichage des résulats
fprintf('\n********************RESULTATS**************************\n');
fprintf('Code de chiffrement trouve= %s\n', best_x);
fprintf('Code de chiffrement attendu= %s\n', y);
fprintf('Texte decrypte= %s\n',  T_chap);
fprintf('Texte original= %s\n', T);

