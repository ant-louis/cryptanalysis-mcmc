function [ PiInf ] = englishFrequency( pinit, Q )
PiInf = pinit*Q^20;
PiInf =transpose(PiInf);
end
