%[Q2.4]Fonction prenant en argument un texte crypte, une loi de
%distribution initiale et une matrice de transition et renvoyant 
%une cle de dechiffrement grace a l'algorithme de Metropolis-Hastings.

function [probPost, best_key] = Metropolis(T,pinit,Q)
   
   %Import symbols ('abcdefghi...')
   symbols; 
    
   %Nombres d'iterations
   n = 5e3;

   %Cle initiale
   key = initialKey(T, pinit, Q);
   
   %Matrice des permutations de y
   keyList = zeros(n,length(symb)); 
   keyList(1,:) = key;
   
   %Matrice des probabilites a posteriori
   probPost = zeros(n,1); 
   probPost(1) = vraisemblance(T,pinit,Q,key);
   
   for i=2:n
        
        %Reprendre la cle precedente
        key = keyList(i-1,:); 
        
        %Permuter 2 lettres, choisies aleatoirement
        i1 = randi([1 40]); 
        i2 = randi([1 40]);
        key([i1 i2]) = key([i2 i1]);

        %Probabilite avec permutation aleatoire de symb
        probKey = vraisemblance(T,pinit,Q,key);
        
        %Calcul converti car les prob sont des log
        alpha = exp(probKey - probPost(i-1));
        
        %Acceptation
        if(rand < alpha)
            probPost(i) = probKey;
            keyList(i,:) = key;
            
        %Rejet
        else
            probPost(i) = probPost(i-1);
            keyList(i,:) = keyList(i-1,:);
        end  
        
   end 
   
   %Cle de decryptage finale
   best_key = char(keyList(i,:));
   
end
