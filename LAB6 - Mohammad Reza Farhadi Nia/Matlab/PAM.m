%----------------------------------------------------------------------%
%%----------------- Lab 6 - Digital Communication --------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Nov 2020 --%
%----------------------------------------------------------------------%

%% Section A

pnSequence1 = comm.PNSequence('Polynomial',[4 3 0], ...
    'SamplesPerFrame',30,'InitialConditions',[0 0 0 1]);
Binary_Random_Input = pnSequence1();
Binary_Input = [Binary_Random_Input(1:15) Binary_Random_Input(16:30)]

NRZ_on_off = Binary_Random_Input;
NRZ_Polar = Binary_Random_Input;

    for i = 1:length(Binary_Random_Input)
        if Binary_Random_Input(i) == 1
            NRZ_Polar(i) = 1;
        else
            NRZ_Polar(i) = -1;
        end
    end

figure

subplot(5,1,1);stairs([-length(Binary_Random_Input)/2+1/2:length(Binary_Random_Input)/2-1/2],Binary_Random_Input)
axis([-length(Binary_Random_Input)/2 length(Binary_Random_Input)/2 -2 2]);title('Input Binary code');grid on; ylabel('Amplitude');

subplot(5,1,2);stairs([-length(NRZ_on_off)/2+1/2:length(NRZ_on_off)/2-1/2],NRZ_on_off)
axis([-length(NRZ_on_off)/2 length(NRZ_on_off)/2 -2 2]);title('NRZ On-Off Binary code');grid on; ylabel('Amplitude');

subplot(5,1,3);stairs([-length(NRZ_Polar)/2+1/2:length(NRZ_Polar)/2-1/2],NRZ_Polar)
axis([-length(NRZ_Polar)/2 length(NRZ_Polar)/2 -2 2]);title('NRZ Polar Binary code');grid on; ylabel('Amplitude');


% RZ duty1 = 0.5
b = Binary_Random_Input; l=length(b); b(l+1)=0; n=1; duty1 = 0.5;
while n<=l
    t=(n-1):.0001:n;
    if b(n)==1
        y=(t<n-(1-duty1) & t>(n-1));
    else
        y=(t>n);
    end
    subplot(5,1,4);plot(t+0.5,y)
    hold on; grid on;
    axis([0 30 -2 2]);
    n=n+1;
end  
title('RZ ON-OFF duty = 0.5'); xlabel('Time'); ylabel('Amplitude');

% RZ duty1 = 0.5
b = Binary_Random_Input; l=length(b); b(l+1)=0; n=1; duty1 = 0.5;
y = [];
while n<=l
    t=(n-1):.001:n;
    if c(n)==1
        y = 1*(t<n-(1-duty) & t>(n-1));
    elseif c(n)==0
        y = -1*((t<n-(1-duty) & t>(n-1)));
    else
        y=0;
    end
    subplot(5,1,5);plot(t+0.5,y)
    hold on; grid on;
    axis([0 30 -2 2]);
    n=n+1;
end  
title('RZ Polar duty = 0.5'); xlabel('Time'); ylabel('Amplitude');

%% Section B

offset = 1/2;
output_NRZ_on_off = Comparator(offset,NRZ_on_off')
output_NRZ_Polar  = Comparator(offset,NRZ_Polar')

%% Function

function Output = Comparator(Offset, input)
        Output = (input>Offset); % you can change equal to strictly
end
