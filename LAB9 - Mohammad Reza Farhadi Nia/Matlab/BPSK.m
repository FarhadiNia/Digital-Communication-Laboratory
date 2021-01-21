%----------------------------------------------------------------------%
%%----------------- LAB 9 - Digital Communication ------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Dec 2020 --%
%----------------------------------------------------------------------%

%% Section A

pnSequence1 = comm.PNSequence('Polynomial',[4 3 0], ...
    'SamplesPerFrame',30,'InitialConditions',[0 0 0 1]);
Binary_Random_Input = pnSequence1();
Binary_Input = [Binary_Random_Input(1:15) Binary_Random_Input(16:30)]

t = (0:0.05:30*2*pi);
NRZ_Polar  = Binary_Random_Input';
BPSK_ = 0*t;

    for i = 1:length(Binary_Random_Input)
        if Binary_Random_Input(i) == 1
            NRZ_Polar(i) = 1;
        else
            NRZ_Polar(i) = -1;
        end
    end
       
    for j = 1:length(t)
        BPSK_(j) = NRZ_Polar(floor(t(j)/(2*pi))+1)*cos(t(j));
    end
    
figure

subplot(6,1,1);stairs([-length(Binary_Random_Input)/2:length(Binary_Random_Input)/2-1],Binary_Random_Input,'k')
axis([-length(Binary_Random_Input)/2 length(Binary_Random_Input)/2 -2 2]);title('Input Binary code');grid on; ylabel('Amplitude');
subplot(6,1,2);stairs([-length(NRZ_Polar)/2:length(NRZ_Polar)/2-1],NRZ_Polar,'r')
axis([-length(NRZ_Polar)/2 length(NRZ_Polar)/2 -2 2]);title('NRZ Polar Binary code');grid on; ylabel('Amplitude');
subplot(6,1,3);plot([-length(t)/2+1/2:length(t)/2-1/2],BPSK_,'r')
axis([-length(t)/2 length(t)/2 -2 2]);title('Binary Phase Shift Keying');grid on; ylabel('Amplitude');

%% Section B

BPSK_Multiplied_Integrated = 0*NRZ_Polar;
BPSK_Multiplied = 0*BPSK_;
    for k = 1:length(t)
        BPSK_Multiplied(k) = BPSK_(k) .* cos(t(k));
    end


    for m = 1:length(NRZ_Polar)
       BPSK_Multiplied_Integrated(m) = sum(BPSK_Multiplied((m-1)*125+1:m*125))/(125);
    end 

    
subplot(6,1,4);plot([-length(BPSK_Multiplied)/2+1/2:length(BPSK_Multiplied)/2-1/2],BPSK_Multiplied,'k')
axis([-length(BPSK_Multiplied)/2 length(BPSK_Multiplied)/2 -2 2]);title('Multiplied');grid on; ylabel('Amplitude');
subplot(6,1,5);plot([-length(BPSK_Multiplied_Integrated)/2+1/2:length(BPSK_Multiplied_Integrated)/2-1/2],BPSK_Multiplied_Integrated,'k')
axis([-length(BPSK_Multiplied_Integrated)/2 length(BPSK_Multiplied_Integrated)/2 -2 2]);title('Integrated');grid on; ylabel('Amplitude');

offset = 0;
BPSK_demodulation = Comparator(offset, BPSK_Multiplied_Integrated);
Binary_Output = reshape(BPSK_demodulation,[],2)

subplot(6,1,6);stairs([-length(BPSK_demodulation)/2:length(BPSK_demodulation)/2-1],BPSK_demodulation,'k')
axis([-length(BPSK_demodulation)/2 length(BPSK_demodulation)/2 -2 2]);title('Output Binary code');grid on; ylabel('Amplitude');

%% Function
    function Output = Comparator(Offset, input)
            Output = (input>Offset); % you can change equal to strictly
    end
   