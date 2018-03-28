%ANSWER FOR THE Q2, must be called: seq1 ->TransMat then Q2
%P(Xt = i)
%distribution uniforme et donc aléatoire
ProbPi = [.25 .25 .25 .25];
%at t place in the sequence
t=9;
Ppit = zeros(t,4);
Ppit(1,:) = ProbPi;
for i=1:t 
    Ppit(i+1,:) = ProbPi*Q^i;
end
figure(1)
plot(Ppit);
xlabel('t');
ylabel('P');
legend('a','b','c','d')
title('P(Xt = i), i = "a","b","c","d" et t = 10')

%by supposing that the first letter is a 'c'
ProbPi = [0 0 1 0];
%at t place in the sequence
t=9;
Ppit = zeros(t,4);
Ppit(1,:) = ProbPi;
for i=1:t 
    Ppit(i+1,:) = ProbPi*Q^i;
end
figure(2)
plot(Ppit);
xlabel('t');
ylabel('P');
legend('a','b','c','d')
title('P(Xt = i), i = "a","b","c","d" et t = 10')