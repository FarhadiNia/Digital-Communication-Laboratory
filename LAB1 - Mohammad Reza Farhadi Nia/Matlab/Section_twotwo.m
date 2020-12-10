%----------------------------------------------------------------------%
%%------------------ Lab 1 Digital Communication --------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
%Source by Matlab Help Edited by Mohammad Reza Farhadi Nia Date:Oct 2020%
%----------------------------------------------------------------------%
pnSequence1 = comm.PNSequence('Polynomial',[3 2 0], ...
    'SamplesPerFrame',21,'InitialConditions',[0 0 1]);
x1 = pnSequence1();
[x1(1:7) x1(8:14) x1(15:21)]

pnSequence2 = comm.PNSequence('Polynomial','x^5+x^3+1', ...
    'InitialConditions',[0 0 0 0 1],'SamplesPerFrame',93);
x2 = pnSequence2();
[x2(1:31) x2(32:62) x2(63:93)]