%Compute the transition matrix, seq1 must be call earlier
Ident = [seq=='a' seq=='b' seq=='c' seq=='d'];
%Ident -> sequence of 0 or 1 if the letter of colons j is present = 1
maxChar = length(Ident(1,:));%number of letter
Q = zeros(maxChar);
for i=1:maxChar
    for j=1:maxChar
        Q(i,j) = sum(Ident(1:end-1,i).*Ident(2:end,j));
        %correspond to the number of the occurance : i is
        %preceding j
    end
    Q(i,:) = Q(i,:)/sum(Ident(:,i)); % divide by the number of char i
    %to have the probability
end
%Problem with sum(Q(1,:)), we have 0.985915492957747, you should have 1
%like other
clear Ident maxChar i j
