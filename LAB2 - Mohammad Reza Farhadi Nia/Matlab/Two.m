%----------------------------------------------------------------------%
%%----------------- Lab 2 - Digital Communication --------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Oct 2020 --%
%----------------------------------------------------------------------%

%%
%Binary__Input = [1 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1  0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0]; 
Binary_Random_Input = randi([0,1],1,100);
Manchester = [Binary_Random_Input Binary_Random_Input];
    
    for i = 1:length(Binary_Random_Input)
        if Binary_Random_Input(i) == 1
            Manchester(2*i-1) = 1;
            Manchester(2*i) = -1;
        else
            Manchester(2*i-1) = -1;
            Manchester(2*i) = 1;
        end
    end

figure

subplot(2,1,1);stairs([-length(Binary_Random_Input)/2+1/2:length(Binary_Random_Input)/2-1/2],Binary_Random_Input);
axis([-length(Binary_Random_Input)/2 length(Binary_Random_Input)/2 -2 2]);title('Input Binary code');grid on;

subplot(2,1,2);stairs([-length(Manchester)/2:length(Manchester)/2-1],Manchester); xlabel('x is twice');
axis([-length(Manchester)/2 length(Manchester)/2-1 -2 2]);title('Manchester Binary code');grid on;