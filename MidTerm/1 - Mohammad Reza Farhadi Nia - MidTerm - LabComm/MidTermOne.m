%----------------------------------------------------------------------%
%%-------------- Lab Mid-Term 1 Digital Communication ------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam ---------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Nov 2020 --%
%----------------------------------------------------------------------%
pnSequence = comm.PNSequence('Polynomial',[3 1 0], ...
    'SamplesPerFrame',21,'InitialConditions',[0 0 1]);
x1 = pnSequence();
[x1(1:7) x1(8:14) x1(15:21)]

Binary_LFSR = x1;
NRZ_Polar = Binary_LFSR;

    for i = 1:length(Binary_LFSR)
        if Binary_LFSR(i) == 1
            NRZ_Polar(i) = 1;
        else
            NRZ_Polar(i) = -1;
        end
    end

figure(1)
subplot(2,1,1);stairs([-length(Binary_LFSR)/2+1/2:length(Binary_LFSR)/2-1/2],Binary_LFSR);
axis([-length(Binary_LFSR)/2 length(Binary_LFSR)/2 -2 2]);title('Input Binary code');grid on;

subplot(2,1,2);stairs([-length(NRZ_Polar)/2+1/2:length(NRZ_Polar)/2-1/2],NRZ_Polar);
axis([-length(NRZ_Polar)/2 length(NRZ_Polar)/2 -2 2]);title('NRZ Polar Binary code');grid on;

