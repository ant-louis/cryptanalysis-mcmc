function [prob_post, best_x] = Q2_5(T,pinit,Q)
    symbols;
    
    %y est (pour le moment) une permutation deux lettres
    %de la variable symb d'origine
    %Plus tard, il faudra utiliser une loi, comme par exemple
    %une gaussienne centrée en la valeur x(i-1)
    % ====> Choix non diffinitif ici !
    
    %Cette dernière nous sert comme code de chiffrement/déchiffrement
    %Le symbole qui a remplacé 'a' sera en y(1), celui qui a remplacé 'b'
    %sera en y(2) etc...
    
    %Nombres de valeurs satisfaisant le taux d'acceptation
    nbtours = 5;

    %Probabilité a postériori
    prob_post = zeros(nbtours,1);
    x = strings; % strings returns an empty string array
    %Le starting state est le symb original et sa vraisemblance
    x(1) = string(symb); %Convert a char array to a string
     
    prob_post(1) = vraisemblance(T,pinit,Q,symb);
    
    
    alpha = zeros(nbtours,1);
    i = 2;
    while(i < nbtours)
        %Taux d'acceptation
        u = rand;
        % Permuter 2 lettres, choisie al�toirement
        iChange1 = randi([0 40]); % choisi un indice al�atoirement
        iChange2 = randi([0 40]);
        temp = y(iChange1);
        y(iChange1) = y(iChange2)
        y(iChange2) = temp;
        
        %Probabilité avec permutation aléatoire de symb (y)
        prob_post_y = vraisemblance(T,pinit,Q,y);
        
        alpha_temp = prob_post_y/prob_post(i-1);
        
        if(u < alpha_temp)
            x(i) = string(y);
            prob_post(i) = prob_post_y
            alpha(i) = alpha_temp;
            i = i +1
 %       else
 %           x(i) = x(i-1);
 %           prob_post(i) = prob_post(i-1);
        end        
    end
    
    
    %Only keep non-zero probabilities values
    prob_post(prob_post==0) = [];

    best_x = x(nbtours-1);
end
