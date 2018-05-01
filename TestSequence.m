clc;
clear all;
load('Q.mat');
load('pinit.mat');
symbols;
<<<<<<< HEAD
T = 'Hello my friend'
=======
T = "Hello darkness my old friend"
>>>>>>> 04cbc11c5ec60674c6152778b6183780e5a8da93
y = symb(randperm(length(symb)));
Tcrypte = encrypt(T,y)
[prob_post, best_x] = Metropolis(Tcrypte,pinit,Q);
T_chap = decrypt(Tcrypte,best_x)