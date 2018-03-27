seq = 'adcacdadadadadcacdadcadbabadcadcadadcadcadcacadcdbadcadadadcdcdcadabadadbadadabadcdadadadbadcadcdbadcadbadadcadcadadcdcadadcdcadbabadcacadcadadadcadbadabadcadcadacadbabacadcadadadcdcadcdcdadcacadcdcda';
tmp = zeros(length(seq),1);
for i=1:length(seq)
    tmp(i) = seq(i);
end
seq = char(tmp);
clear tmp i

