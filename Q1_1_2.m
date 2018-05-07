%[Q1_1_2] Represente les differents graphes de la question 1.1.2
%distribution uniforme et donc aleatoire

function Q1_1_2 ( Q )

    t=9;
    Ppit = zeros(t,4);

    %--La premiere lettre est choisie au hasard--
    ProbPi = [.25 .25 .25 .25];
    Ppit(1,:) = ProbPi;
    
    for i=1:t 
        Ppit(i+1,:) = ProbPi*Q^i;
    end
    %Graphe
    figure(1);
    plot(Ppit);
    xlabel('t');
    ylabel('P');
    legend('a','b','c','d');
    title('P(Xt = i), i = "a","b","c","d" et t = 10');
    
    
    %--La premiere lettre est toujours 'c'--
    ProbPi = [0 0 1 0];
    Ppit(1,:) = ProbPi;
    
    for i=1:t 
        Ppit(i+1,:) = ProbPi*Q^i;
    end
    %Graphe
    figure(2);
    plot(Ppit);
    xlabel('t');
    ylabel('P');
    legend('a','b','c','d');
    title('P(Xt = i), i = "a","b","c","d" et t = 10');

end

