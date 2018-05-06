clc;
clear;
load('Q.mat');
load('pinit.mat');
symbols;

%T = 'The news that a wealthy young gentleman named Charles Bingley has rented the manor known as Netherfield Park causes a great stir in the neighboring village of Longbourn';
y = symb(randperm(length(symb)));
%y = 'bacdefghijklmnopqrstuvwxyz,.''"-!?:;()[] ';
%Tcrypte = encrypt(T,y);
Tcrypte ='-yf)qrtfftrqwspr(-:r-rlesqqpr(tf:b:wnqsrynegr(nqqntorftr-ryf)owcr-tgr(ntontor(fr(:ssqdprqw-qrqwspr(qfllsgrqfrdn(qst,r-tgr:wstrwsrw-gr''ntn(wsgrqwsrynegr(les-grwn(r:nto(r-tgr''ds:rys''fesrqwskcr-tgrqwspr''fddf:sgr-''qserwnkr)tqndrqwspra-ksrqfr-rdnqqdsrwf)(scr-tgrqwsrynegrlseawsgrftrqwsreff''cr-tgr:wstrqwspra-ksrts-eserqwspr(-:rqw-qrqwsrwf)(sr:-(ry)ndqrf''ryes-gcr-tgreff''sgr:nqwra-is("r-tgrqwsr:ntgf:r:-(rf''rqe-t(l-estqr()o-e,rh:sr:nddrw-!sr(fksrf''rqwn(chr(-ngrw-t(sdcrh-tgrk-isr-r''ntsrks-d,rnr:nddrs-qr-rlnsasrf''rqwsreff''croesqwsdcr-tgrpf)ra-trw-!sr(fksrf''rqwsr:ntgf:bqw-qr:nddrq-(qsr(:ssq,hr(frw-t(sdres-awsgr)lr-tgryefisrf''r-rynqrf''rqwsreff''cr;)(qrqfr(ssrwf:rnqrq-(qsgcr-tgroesqwsdr(qffgryprqwsr:ntgf:r-tgrot-:sgr-qrnq,rqwstrqwsprws-egr-rqwntr!fnasra-ddrf)qr''efkrnt(ngscrhtnyydscrtnyydscrdnisr-rkf)(scr:wfrn(rtnyydntor-qrkprwf)(s hr-tgrqwsrawndgestr-t(:sesgcrhts!serkntgcrnqrn(rqwsr:ntg,hr-tgrqwspr:stqrftrs-qntocrts!sergn(q)eyntorqwsk(sd!s(,rw-t(sdcr:wfr''f)tgrqw-qrqwsreff''rq-(qsgr!seprtnascrqffirgf:tr-roes-qrlnsasrf''rnqcr-tgroesqwsdrl)ddsgrf)qr-rd-eosref)tgr:ntgf:bl-tscr-tgr(-qrwsergf:tr-tgryso-tr)lftrnq,';
[prob_post, best_x] = Metropolis(Tcrypte,pinit,Q);
T_chap = decrypt(Tcrypte,best_x);
[nbCorrectLet, correctLetters] = CorrectLetter(y,best_x);

%Affichage des résulats
fprintf('\n********************RESULTATS**************************\n');
fprintf('Code de chiffrement trouve= %s\n', best_x);
fprintf('Code de chiffrement attendu= %s\n', y);
fprintf('Nb de symboles decryptes: %d  ->  %s\n\n', nbCorrectLet, correctLetters);
fprintf('Texte decrypte= %s\n',  T_chap);
%fprintf('Texte original= %s\n', T);
