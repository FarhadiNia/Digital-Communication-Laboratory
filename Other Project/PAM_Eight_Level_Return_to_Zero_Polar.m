%% Code by Mohammad Reza Farhadi Nia 30 Dec 2020

%% A
pnSequence1 = comm.PNSequence('Polynomial','x^6+x^5+1', ...
    'SamplesPerFrame',126,'InitialConditions',[0 0 0 0 0 1]);
Binary_Random_Input = pnSequence1();
Binary_Input_test = [Binary_Random_Input(1:63) Binary_Random_Input(64:126)];
Binary_Random_Input = Binary_Random_Input(1:50)';

pnSequence2 = comm.PNSequence('Polynomial','x^6+x^5+1',...
    'BitPackedOutput',true,'NumPackedBits',3,...
    'SamplesPerFrame',17,'InitialConditions',[0 0 0 0 0 1]);
Three_Bit_Input_Pack = pnSequence2();

%% B
NRZ_Polar = [];

    for i = 1:length(Binary_Random_Input)
        if Binary_Random_Input(i) == 1
            NRZ_Polar = [NRZ_Polar 1 0];
        else
            NRZ_Polar = [NRZ_Polar -1 0];
        end
    end

figure

subplot(4,1,1);stairs([-length(Binary_Random_Input)/2+1:length(Binary_Random_Input)/2],Binary_Random_Input); xlabel('String');
axis([-length(Binary_Random_Input)/2 length(Binary_Random_Input)/2 -2 2]);title('Input Binary code');grid on; ylabel('Amplitude');

subplot(4,1,2);stairs([-length(NRZ_Polar)/2+2:+1+length(NRZ_Polar)/2],NRZ_Polar,'g'); xlabel('String');
axis([-length(NRZ_Polar)/2 length(NRZ_Polar)/2 -2 2]);title('NRZ Polar Binary code');grid on; ylabel('Amplitude');

Eight_Level = [];

for i = 1:17
    switch Three_Bit_Input_Pack(i)   
       case 0
           Eight_Level = [Eight_Level -4 0];       
       case 1
           Eight_Level = [Eight_Level -3 0];       
       case 2
           Eight_Level = [Eight_Level -2 0]; 
       case 3
           Eight_Level = [Eight_Level -1 0];
       case 4
           Eight_Level = [Eight_Level 1 0];
       case 5
           Eight_Level = [Eight_Level 2 0];
       case 6
           Eight_Level = [Eight_Level 3 0];
       case 7
           Eight_Level = [Eight_Level 4 0];  
    end
end
subplot(4,1,3);stairs([-length(Eight_Level)/2+2:+1+length(Eight_Level)/2],Eight_Level,'r');xlabel('String');
axis([-length(Eight_Level)/2 length(Eight_Level)/2 -5 5]);title('PAM RZ 8 Level');grid on; ylabel('Amplitude');
    
%% C
Binary_OutPut_Detection = [];

for i = 1:2:33
    if  Eight_Level(i) > 3.5
        Binary_OutPut_Detection = [Binary_OutPut_Detection 1 1 1]
    elseif Eight_Level(i) > 2.5
        Binary_OutPut_Detection = [Binary_OutPut_Detection 1 1 0]
    elseif Eight_Level(i) > 1.5
        Binary_OutPut_Detection = [Binary_OutPut_Detection 1 0 1]
    elseif Eight_Level(i) > 0
        Binary_OutPut_Detection = [Binary_OutPut_Detection 1 0 0]
    elseif Eight_Level(i) > -1.5
        Binary_OutPut_Detection = [Binary_OutPut_Detection 0 1 1]
    elseif Eight_Level(i) > -2.5
        Binary_OutPut_Detection = [Binary_OutPut_Detection 0 1 0]
    elseif Eight_Level(i) > -3.5
        Binary_OutPut_Detection = [Binary_OutPut_Detection 0 0 1]
    else 
        Binary_OutPut_Detection = [Binary_OutPut_Detection 0 0 0]
    end  
end
subplot(4,1,4);stairs([-length(Binary_OutPut_Detection)/2+1.5:+0.5+length(Binary_OutPut_Detection)/2],Binary_OutPut_Detection,'k'); xlabel('String');
axis([-length(Binary_OutPut_Detection)/2 length(Binary_OutPut_Detection)/2 -2 2]);title('Binary OutPut Detected');grid on; ylabel('Amplitude');
