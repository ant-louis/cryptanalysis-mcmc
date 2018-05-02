clc;
clear all;
load('Q.mat');
load('pinit.mat');
symbols;
T = 'The news that a wealthy young gentleman named Charles Bingley has rented the manor known as Netherfield Park causes a great stir in the neighboring village of Longbourn, especially in the Bennet household. The Bennets have five unmarried daughters, and Mrs. Bennet, a foolish and fussy gossip, is the sort who agrees with the novel’s opening words. At the end of the evening, the Bennet women return to their house, where Mrs. Bennet regales her husband with stories from the evening until he insists that she be silent. Upstairs, Jane relates to Elizabeth her surprise that Bingley danced with her twice, and Elizabeth replies that Jane is unaware of her own beauty. Both girls agree that Bingley’s sisters are not well-mannered, but whereas Jane insists that they are charming in close conversation, Elizabeth continues to harbor a dislike for them.'
y = symb(randperm(length(symb)));
Tcrypte = encrypt(T,y)
[prob_post, best_x] = Metropolis(Tcrypte,pinit,Q);
T_chap = decrypt(Tcrypte,best_x)