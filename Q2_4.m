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
    nbtours = 1000;

    %Probabilité a postériori
    prob_post = zeros(nbtours,1);
    x = zeros(nbtours,length(symb)); % strings returns an empty string array
    %Le starting state est le symb original et sa vraisemblance
    x(1,:) = char(symb); %Convert a char array to a string
     
    prob_post(1) = vraisemblance(T,pinit,Q,symb);
    
    
    alpha = zeros(nbtours,1);
    y = symb(randperm(length(symb)));

    for i=2:nbtours
        %Taux d'acceptation
        u = rand;
        % Permuter 2 lettres, choisie aleatoirement
        iChange1 = randi([1 40]); % choisi un indice aleatoirement
        iChange2 = randi([1 40]);
        temp = y(iChange1);
        y(iChange1) = y(iChange2);
        y(iChange2) = temp;
        
        %Probabilité avec permutation aléatoire de symb (y)
        prob_post_y = vraisemblance(T,pinit,Q,y);
        
        alpha_temp = prob_post_y/prob_post(i-1);
        
        if(u < alpha_temp)
            x(i,:) = char(y);
            prob_post(i) = prob_post_y;
            alpha(i) = alpha_temp;

        else
            x(i,:) = x(i-1,:);
            prob_post(i) = prob_post(i-1);
        end        
    end
    
    
    %Only keep non-zero probabilities values
    prob_post =  unique(prob_post,'stable');
    x(nbtours,:)
    best_x = char(x(nbtours,:));
end
