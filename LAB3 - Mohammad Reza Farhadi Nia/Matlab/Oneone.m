%----------------------------------------------------------------------%
%%----------------- Lab 3 - Digital Communication --------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Oct 2020 --%
%----------------------------------------------------------------------%

%%

%Binary_Random_Input = [1 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1  0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 1 0 1 0]; 
Binary_Random_Input = randi([0,1],1,100);

%this piece of code has got from https://www.mathworks.com/matlabcentral/fileexchange/40028-non-return-to-zero-nrz-line-code 
% then it has changed to RZ (Me)

% Input Binary code
figure
subplot(4,1,1);stairs([-length(Binary_Random_Input)/2+1/2:length(Binary_Random_Input)/2-1/2],Binary_Random_Input);
axis([-length(Binary_Random_Input)/2 length(Binary_Random_Input)/2 -2 2]);title('Input Binary code');grid on;
flag = 1;


% RZ duty1 = 0.5
b=Binary_Random_Input;
l=length(b);
b(l+1)=0;
n=1;
duty1 = 0.5;
while n<=l
    t=(n-1):.0001:n;
    if b(n)==1
        if b(n+1)==b(n)
            y=(t<=n-(1-duty1) & t>=(n-1));   % Changed
        else 
            y=(t<n-(1-duty1) & t>(n-1));     % Changed
        end
    else
        if b(n+1)==b(n)
            y=(t>n);
        else
            y=(t>=n);
        end
    end
    subplot(4,1,2);plot(t,y)
    hold on;
    axis([0 100 -2 2]);
    n=n+1;
end  
title('RZ 0.5');
xlabel('Time');
ylabel('Amplitude');

% RZ duty2 = 0.5
n=1;
duty2 = 0.5;
while n<=l
    t=(n-1):.0001:n;
    if b(n)==1 &&  flag == 1
        if b(n+1)==b(n)
            y=(t<=n-(1-duty2) & t>=(n-1));   % Changed
        else 
            y=(t<n-(1-duty2) & t>(n-1));     % Changed
        end
        flag = ~flag;
    elseif b(n)==1 &&  flag == 0
        if b(n+1)==b(n)
            y=(t>n);
        else
            y=(t>=n);
        end
        flag = ~flag;
    else
        if b(n+1)==b(n)
            y=(t>n);
        else
            y=(t>=n);
        end
    end
    subplot(4,1,3);plot(t,y)
    hold on;
    axis([0 100 -2 2]);
    n=n+1;
end  
title('RZ S 0.5');
xlabel('Time');
ylabel('Amplitude');

% RZ duty2 = 0.5
n=1;
duty2 = 0.5;
while n<=l
    t=(n-1):.0001:n;
    if b(n)==1 
        if b(n+1)==b(n)
            y=(t<=n-(1-duty2) & t>=(n-1));   % Changed
        else 
            y=(t<n-(1-duty2) & t>(n-1));     % Changed
        end
    elseif b(n)==0 &&  flag == 0
        if b(n+1)==b(n)
            y=(t<=n-(1-duty2) & t>=(n-1));   % Changed
        else 
            y=(t<n-(1-duty2) & t>(n-1));     % Changed
        end
        flag = ~flag;
    elseif b(n)==0  &&  flag == 1
        if b(n+1)==b(n)
            y=(t>n);
        else
            y=(t>=n);
        end
        flag = ~flag;
    end
    subplot(4,1,4);plot(t,y)
    hold on;
    axis([0 100 -2 2]);
    n=n+1;
end  
title('RZ M 0.5');
xlabel('Time');
ylabel('Amplitude');
