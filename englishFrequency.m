function [ PiInf ] = englishFrequency( pinit, Q )
%STATIONENGLISH: trouve la distribution stationnaire d'un texte anglais
PiInf = pinit*Q^20;
PiInf =transpose(PiInf);
end

