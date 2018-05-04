function [prob_post, best_x] = Metropolis(T,pinit,Q)

   symbols; %Import symbols
    
   %y est une permutation deux lettres de la variable symb d'origine
   %Cette dernière nous sert comme code de chiffrement/déchiffrement
   %Le symbole qui a remplacé 'a' sera en y(1), celui qui a remplacé 'b'
   %sera en y(2) etc...
    
   %Nombres d'iterations
   n = 10000;

   %Initialisation des variables
   y = symb(randperm(length(symb))); %Permutation alétoire des 40 symboles
    
   x = zeros(n,length(symb)); %Matrice des n permutations de y
   x(1,:) = y;
    
   prob_post = zeros(n,1); %Probabilité a postériori
   prob_post(1) = vraisemblance(T,pinit,Q,y);

   change = 0;
   
   for i=2:n
        
        % Permuter 2 lettres, choisie aleatoirement
        iChange1 = randi([1 40]); 
        iChange2 = randi([1 40]);
        temp = y(iChange1);
        y(iChange1) = y(iChange2);
        y(iChange2) = temp;
        
        %Probabilité avec permutation aléatoire de symb (y)
        prob_post_y = vraisemblance(T,pinit,Q,y);
        
        alpha = exp(prob_post_y - prob_post(i-1));
        
        if(rand < min(1, alpha))
            prob_post(i) = prob_post_y;
            x(i,:) = char(y);
            change = change+1;
        else
            prob_post(i) = prob_post(i-1);
            x(i,:) = x(i-1,:);
        end  
                 
        %Afficher la progression de l'algorithme courante
        if(mod(i,100) == 0)
            fprintf('Iter %d\n', i);
            fprintf('Permutation= %s\n', char(x(i,:)));
            fprintf('prob= %f\n', prob_post_y);
            fprintf('Alpha= %f\n\n', alpha);
        end
        
   end 
   
   %Only keep unique probability values
   prob_post =  unique(prob_post,'stable');
   best_x = char(x(i,:));
   fprintf('\nNb changements= %d\n', change);
   
end
