%----------------------------------------------------------------------%
%%----------------- Lab 7 - Digital Communication --------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Nov 2020 --%
%----------------------------------------------------------------------%

%% Section A
pnSequence1 = comm.PNSequence('Polynomial',[4 3 0], ...
    'SamplesPerFrame',30,'InitialConditions',[0 0 0 1]);
Binary_Random_Input = pnSequence1();
Binary_Input = [Binary_Random_Input(1:15) Binary_Random_Input(16:30)]

figure
subplot(4,1,1);stairs([-length(Binary_Random_Input)/2:length(Binary_Random_Input)/2-1],Binary_Random_Input)
axis([-length(Binary_Random_Input)/2 length(Binary_Random_Input)/2 -0.5 1.5]);title('Input Binary code');grid on; ylabel('Amplitude');

b = Binary_Random_Input;  %%
l=length(b); b(l+1)=0; n=1; 
OUT = [];
while n<=l
    t=(n-1):.001:n;
    if b(n)==1
        duty = 0.75;
        y=(t<n-(1-duty) & t>(n-1));
        OUT = [OUT y];
    else
        duty = 0.5;
        y=(t<n-(1-duty) & t>(n-1));
        OUT = [OUT y];
    end
    subplot(4,1,2);plot(t,y); hold on; grid on; axis([0 30 -0.5 1.5]);
    n=n+1;
end  
title('PWM Modulation'); xlabel('Time'); ylabel('Amplitude'); hold off;

%% Section B
offset = (0.5 + 0.75)/2;
PWM_Dem_Integrated = 0*Binary_Random_Input;
Pwm = OUT;
    for k = 1:length(Binary_Random_Input)
       PWM_Dem_Integrated(k) = sum(OUT((k-1)*1001+1:k*1001))/(1001);
    end 

subplot(4,1,3);plot([-length(PWM_Dem_Integrated)/2:length(PWM_Dem_Integrated)/2-1],PWM_Dem_Integrated,'k')
axis([-length(PWM_Dem_Integrated)/2 length(PWM_Dem_Integrated)/2 -0.5 1.5]);title('Integrated');grid on; ylabel('Amplitude');

output_PWM_dem = Comparator(offset, PWM_Dem_Integrated)'

subplot(4,1,4);stairs([-length(output_PWM_dem)/2:length(output_PWM_dem)/2-1],output_PWM_dem,'r')
axis([-length(output_PWM_dem)/2 length(output_PWM_dem)/2 -0.5 1.5]);title('Output Binary code');grid on; ylabel('Amplitude');

%% Function
    function Output = Comparator(Offset, input)
            Output = (input>Offset); % you can change equal to strictly
    end