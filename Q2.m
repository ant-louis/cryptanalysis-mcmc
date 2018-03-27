%ANSWER FOR THE Q2, must be called: seq1 ->TransMat then Q2
%P(Xt = i)
%uniform distribution
ProbPi = [.25 .25 .25 .25];
%at t place in the sequence
t=3;
Ppit = ProbPi*Q^t;
%by supposing that the first letter is a 'c'
ProbPi = [0 0 1 0];
Ppit = ProbPi*Q^t;
% graph
Graph = zeros(3,4);
time= 15;
for i=1:time
    Graph(i,:) = ProbPi*Q^(i-1);
end
plot(Graph);
xlabel('Step')
ylabel('Probability')
legend('a','b','c','d')
clear t Graph ProbPi time Ppit i 