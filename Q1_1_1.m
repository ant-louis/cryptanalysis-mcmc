function [ Q, pi0 ] = Q1_1_1( seq )
%Q1.1.1 Prend en argument la chaine de caractère et revoie la matrice de
%transition Q et la distribution de probabilté pi0
%   Detailed explanation goes here
Q(1,1) = length(strfind(seq,'aa'))/(length(strfind(seq,'a'))-1);
Q(1,2) = length(strfind(seq,'ab'))/(length(strfind(seq,'a'))-1);
Q(1,3) = length(strfind(seq,'ac'))/(length(strfind(seq,'a'))-1);
Q(1,4) = length(strfind(seq,'ad'))/(length(strfind(seq,'a'))-1);
%on retire -1 car la premier letter est "a"

%Pour b
Q(2,1) = length(strfind(seq,'ba'))/length(strfind(seq,'b'));
Q(2,2) = length(strfind(seq,'bb'))/length(strfind(seq,'b'));
Q(2,3) = length(strfind(seq,'bc'))/length(strfind(seq,'b'));
Q(2,4) = length(strfind(seq,'bd'))/length(strfind(seq,'b'));

%Pour c
Q(3,1) = length(strfind(seq,'ca'))/length(strfind(seq,'c'));
Q(3,2) = length(strfind(seq,'cb'))/length(strfind(seq,'c'));
Q(3,3) = length(strfind(seq,'cc'))/length(strfind(seq,'c'));
Q(3,4) = length(strfind(seq,'cd'))/length(strfind(seq,'c'));

%Pour d
Q(4,1) = length(strfind(seq,'da'))/length(strfind(seq,'d'));
Q(4,2) = length(strfind(seq,'db'))/length(strfind(seq,'d'));
Q(4,3) = length(strfind(seq,'dc'))/length(strfind(seq,'d'));
Q(4,4) = length(strfind(seq,'dd'))/length(strfind(seq,'d'));

%Pour trouver pi0
pi0 = zeros(1,4);
pi0(1) = length(strfind(seq,'a'))/length(seq);
pi0(2) = length(strfind(seq,'b'))/length(seq);
pi0(3) = length(strfind(seq,'c'))/length(seq);
pi0(4) = length(strfind(seq,'d'))/length(seq);

end
