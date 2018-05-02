clc;
clear all;
load('Q.mat');
load('pinit.mat');
symbols;
T='Few people would choose a prison as the location for a special evening out. However, Italy has launched its first restaurant to be located in a real jail.  At the Ingalera Restaurant in Bollate prison, Milan, there are four prisoners working as waiters and five others cooking in the kitchen, headed by a professional chef and a maître. It is a ground-breaking project, which allows prisoners to be gradually included into society. The reataurant has had great reviews: everyone says the food is worth going to prison for.'
y = symb(randperm(length(symb)));
Tcrypte = encrypt(T,y)
[prob_post, best_x] = Metropolis(Tcrypte,pinit,Q);
T_chap = decrypt(Tcrypte,best_x)