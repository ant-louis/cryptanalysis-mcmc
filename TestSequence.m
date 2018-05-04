clc;
clear all;
load('Q.mat');
load('pinit.mat');
symbols;
T = 'The news that a wealthy young gentleman named Charles Bingley has rented the manor known as Netherfield Park causes a great stir in the neighboring village of Longbourn'
%y = symb(randperm(length(symb)));
y = 'bacdefghijklmnopqrstuvwxyz,.''"-!?:;()[] ';
Tcrypte = encrypt(T,y)
[prob_post, best_x] = Metropolis(Tcrypte,pinit,Q);
T_chap = decrypt(Tcrypte,best_x)