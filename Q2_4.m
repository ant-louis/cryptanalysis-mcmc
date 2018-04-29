function [prob_post, best_x] = Q2_4(T,pinit,Q)
    symbols;
    
    %y est (pour le moment) une permutation aléatoire
    %de la variable symb d'origine
    %Plus tard, il faudra utiliser une loi, comme par exemple
    %une gaussienne centrée en la valeur x(i-1)
    
    %Cette dernière nous sert comme code de chiffrement/déchiffrement
    %Le symbole qui a remplacé 'a' sera en y(1), celui qui a remplacé 'b'
    %sera en y(2) etc...
    
    %Nombres de valeurs satisfaisant le taux d'acceptation
    nbtours = 10;

    %Probabilité a postériori
    prob_post = zeros(nbtours,1);
    x = strings; % strings returns an empty string array
    %Starting est le symb original et sa vraisemblance
    x(1) = string(symb); %Convert a char array to a string
    prob_post(1) = vraisemblance(T,pinit,Q,symb);
    
    %Taux d'acceptation
    u = 0.95;
    
    alpha = zeros(nbtours,1);
    i = 2;
    while(i < nbtours)
        y = symb(randperm(length(symb)));
        %Probabilité avec permutation aléatoire de symb (y)
        prob_post_y = vraisemblance(T,pinit,Q,y);
        
        alpha_temp = prob_post_y/prob_post(i-1);
        
        if(u < alpha_temp)
            x(i) = string(y);
            prob_post(i) = prob_post_y;
            alpha(i) = alpha_temp;
            i = i +1
 %       else
 %           x(i) = x(i-1);
 %           prob_post(i) = prob_post(i-1);
        end        
    end
    
    
    %Only keep non-zeros alpha values
    prob_post(prob_post==0) = [];
    
    best_x = x(nbtours-1);
end