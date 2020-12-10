%----------------------------------------------------------------------%
%%----------------- Lab 2 - Digital Communication --------------------%%
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
subplot(5,1,1);stairs([-length(Binary_Random_Input)/2+1/2:length(Binary_Random_Input)/2-1/2],Binary_Random_Input);
axis([-length(Binary_Random_Input)/2 length(Binary_Random_Input)/2 -2 2]);title('Input Binary code');grid on;

% RZ duty1 = 0.25
b=Binary_Random_Input;
l=length(b);
b(l+1)=0;
n=1;
duty1 = 0.25;
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
    subplot(5,1,2);plot(t,y)
    hold on;
    axis([0 100 -2 2]);
    n=n+1;
end  
title('RZ 0.25');
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
    else
        if b(n+1)==b(n)
            y=(t>n);
        else
            y=(t>=n);
        end
    end
    subplot(5,1,3);plot(t,y)
    hold on;
    axis([0 100 -2 2]);
    n=n+1;
end  
title('RZ 0.5');
xlabel('Time');
ylabel('Amplitude');

% RZ duty3 = 0.75
n=1;
duty3 = 0.7;
while n<=l
    t=(n-1):.0001:n;
    if b(n)==1
        if b(n+1)==b(n)
            y=(t<=n-(1-duty3) & t>=(n-1));   % Changed
        else 
            y=(t<n-(1-duty3) & t>(n-1));     % Changed
        end
    else
        if b(n+1)==b(n)
            y=(t>n);
        else
            y=(t>=n);
        end
    end
    subplot(5,1,4);plot(t,y)
    hold on;
    axis([0 100 -2 2]);
    n=n+1;
end  
title('RZ 0.75');
xlabel('Time');
ylabel('Amplitude');

% RZ duty4 = 0.75
n=1;
duty4 = 0.9;
while n<=l
    t=(n-1):.0001:n;
    if b(n)==1
        if b(n+1)==b(n)
            y=(t<=n-(1-duty4) & t>=(n-1));   % Changed
        else 
            y=(t<n-(1-duty4) & t>(n-1));     % Changed
        end
    else
        if b(n+1)==b(n)
            y=(t>n);
        else
            y=(t>=n);
        end
    end
    subplot(3,1,1);plot(t,y);    
    hold on;
    plot(t,y);    
    hold on;
    axis([0 1 -2 100]);
    len = length(y);
    xdft = fft(y);
    xdft(1:length(xdft)/2);
    freq = 0:50/len:49.995000499950000;
    plot(freq,abs(xdft))
    xlabel('Hz'); ylabel('Magnitude')
    n=n+1;
end  
title('RZ 0.9;');
xlabel('Time');
ylabel('Amplitude');
