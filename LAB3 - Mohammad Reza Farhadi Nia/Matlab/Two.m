%----------------------------------------------------------------------%
%%----------------- Lab 3 - Digital Communication --------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Oct 2020 --%
%----------------------------------------------------------------------%

%%
%Binary_Input = [1 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1  0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0]; 
%Binary_Random_Input = randi([0,1],1,100);
AMI = Binary_Random_Input;
flag = 1;

    for i = 1:length(Binary_Random_Input)
        if Binary_Random_Input(i) == 1 &&  flag == 1
            AMI(i) = 1;
            flag = ~flag; 
        elseif Binary_Random_Input(i) == 1 &&  flag == 0
            AMI(i) = -1;
            flag = ~flag; 
        else
            AMI(i) = 0;
        end
    end

figure(1)

subplot(3,1,1);stairs([-length(Binary_Random_Input)/2+1/2:length(Binary_Random_Input)/2-1/2],Binary_Random_Input);
axis([-length(Binary_Random_Input)/2 length(Binary_Random_Input)/2 -2 2]);title('Input Binary code');grid on;

subplot(3,1,2);stairs([-length(AMI)/2+1/2:length(AMI)/2-1/2],AMI);
axis([-length(AMI)/2 length(AMI)/2 -2 2]);title('AMI Binary code');grid on;

% RZ duty1 = 0.5
b=Binary_Random_Input;
l=length(b);
b(l+1)=0;
n=1;
duty2 = 0.5;
while n<=l
    t=(n-1):.0001:n;
    if b(n)==1 &&  flag == 1                 % Changed
        if b(n+1)==b(n)
            y=(t<=n-(1-duty2) & t>=(n-1));   % Changed
        else 
            y=(t<n-(1-duty2) & t>(n-1));     % Changed
        end
        flag = ~flag;                        % Changed
    elseif b(n)==1 &&  flag == 0             % Changed
        if b(n+1)==b(n)
            y=-(t<=n-(1-duty2) & t>=(n-1));   % Changed
        else 
            y=-(t<n-(1-duty2) & t>(n-1));     % Changed
        end
        flag = ~flag;
    else
        if b(n+1)==b(n)
            y=(t>n);
        end
    end
    subplot(3,1,3);plot(t,y)
    hold on;
    axis([0 100 -2 2]);
    n=n+1;
end  
title('AMI RZ 0.5');
xlabel('Time');
ylabel('Amplitude');
