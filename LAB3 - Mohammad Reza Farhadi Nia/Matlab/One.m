%----------------------------------------------------------------------%
%%----------------- Lab 3 - Digital Communication --------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Oct 2020 --%
%----------------------------------------------------------------------%

%%
%Binary_Input = [1 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1  0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0]; 
Binary_Random_Input = randi([0,1],1,100);
NRZ_S = Binary_Random_Input;
NRZ_M = Binary_Random_Input;
flag = 1;

    for i = 1:length(Binary_Random_Input)
        if Binary_Random_Input(i) == 1 &&  flag == 1
            NRZ_S(i) = 1;
            flag = ~flag; 
        elseif Binary_Random_Input(i) == 1 &&  flag == 0
            NRZ_S(i) = 0;
            flag = ~flag; 
        else
            NRZ_S(i) = 0;
        end
    end
    
    for i = 1:length(Binary_Random_Input)
        if Binary_Random_Input(i) == 0 &&  flag == 1
            NRZ_M(i) = 0;
            flag = ~flag; 
        elseif Binary_Random_Input(i) == 0 &&  flag == 0
            NRZ_M(i) = 1;
            flag = ~flag; 
        else
            NRZ_M(i) = 1;
        end
    end  

figure(1)

subplot(3,1,1);stairs([-length(Binary_Random_Input)/2+1/2:length(Binary_Random_Input)/2-1/2],Binary_Random_Input);
axis([-length(Binary_Random_Input)/2 length(Binary_Random_Input)/2 -2 2]);title('Input Binary code = NRZ Binary code');grid on;

subplot(3,1,2);stairs([-length(NRZ_S)/2+1/2:length(NRZ_S)/2-1/2],NRZ_S);
axis([-length(NRZ_S)/2 length(NRZ_S)/2 -2 2]);title('NRZ S Binary code');grid on;

subplot(3,1,3);stairs([-length(NRZ_M)/2+1/2:length(NRZ_M)/2-1/2],NRZ_M);
axis([-length(NRZ_M)/2 length(NRZ_M)/2 -2 2]);title('NRZ M Binary code');grid on;

