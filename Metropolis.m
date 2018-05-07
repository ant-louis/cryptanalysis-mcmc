function [probPost, best_key] = Metropolis(T,pinit,Q)
   
   %Import symbols ('abcdefghi...')
   symbols; 
    
   %Nombres d'iterations
   n = 5e3;

   %Permutation alétoire des 40 symboles
   key = symb(randperm(length(symb)));
   
   %Matrice des permutations de y
   keyList = zeros(n,length(symb)); 
   keyList(1,:) = char(key);
   
   %Matrice des probabilites a posteriori
   probPost = zeros(n,1); 
   probPost(1) = vraisemblance(T,pinit,Q,key);
   
   %Nb d'acceptations
   accept = 0;
   
   for i=2:n
        
        %Reprendre la cle precedente
        key = keyList(i-1,:); 
        
        %Permuter 2 lettres, choisies aleatoirement
        i1 = randi([1 40]); 
        i2 = randi([1 40]);
        temp = key(i1);
        key(i1) = key(i2);
        key(i2) = temp;
        
        %Probabilité avec permutation aléatoire de symb (y)
        probKey = vraisemblance(T,pinit,Q,key);
        
        %Calcul converti car les prob sont des log
        alpha = exp(probKey - probPost(i-1));
        
        %Acceptation
        if(rand < alpha)
            probPost(i) = probKey;
            keyList(i,:) = char(key);
            accept = accept+1;
            
        %Rejet
        else
            probPost(i) = probPost(i-1);
            keyList(i,:) = keyList(i-1,:);
        end  
        
        %Afficher la progression de l'algorithme courante
        if(mod(i,100) == 0)
            fprintf('Iter %d\n', i);
%             fprintf('Permutation= %s\n', char(x(i,:)));
%             fprintf('prob= %f\n', probKey);
%             fprintf('Alpha= %e\n\n', alpha);
        end
        
   end 
   
%    %---Graphique des prob a posteriori en fonction de l'iteration
%    subplot(2,1,2)
%    plot(prob_post);
%    xlabel('iteration');
%    ylabel('Probabilite a posteriori');
%    title('Probabilite a posteriori/Iteration');
%    %----
   
   %Only keep unique probability values
   probPost =  unique(probPost,'stable');
   best_key = char(keyList(i,:));
   fprintf('\nNb accept= %d\n', accept);
   
end
