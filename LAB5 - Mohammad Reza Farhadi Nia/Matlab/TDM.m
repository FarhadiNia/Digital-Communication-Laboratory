%----------------------------------------------------------------------%
%%------------------ Lab 5 Digital Communication --------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Oct 2020 --%
%----------------------------------------------------------------------%

%% MUX
% Inputs : 8 bit frames

Tail0 = 0*(1:128);
cha1in  = randi([0 1],1,128);
cha2in  = randi([0 1],1,128);
cha3in  = randi([0 1],1,128);
cha4in  = randi([0 1],1,128);
cha5in  = randi([0 1],1,128);
Tail1 = 0*(1:128) + 1;
Parity = xor(xor(xor(xor(cha1in,cha2in),cha3in),cha4in),cha5in);

Parallel_input = [Tail0; cha1in; cha2in; cha3in; cha4in; cha5in; Parity; Tail1];

Sereies = Par2SerOpt(Parallel_input, 8, 128)

%% DMUX
% Output

Prallel_output = Ser2ParOpt(Sereies, 8)

cha1out  = Prallel_output(2,:);
cha2out  = Prallel_output(3,:);
cha3out  = Prallel_output(4,:);
cha4out  = Prallel_output(5,:);
cha5out  = Prallel_output(6,:);

erorr = Parallel_input - Prallel_output;
erorr1 = cha1out - cha1in; 

figure

subplot(6,1,1);stairs([-length(cha1in)/2+1/2:length(cha1in)/2-1/2],cha1in);
axis([-length(cha1in)/2 length(cha1in)/2 -2 2]);title('Channe 1 Input = Channe 1 Output');grid on;

subplot(6,1,2);stairs([-length(cha2out)/2+1/2:length(cha1out)/2-1/2],cha2out);
axis([-length(cha2out)/2 length(cha2out)/2 -2 2]);title('Channe 2 Input = Channe 2 Output');grid on;

subplot(6,1,3);stairs([-length(cha3in)/2+1/2:length(cha3in)/2-1/2],cha3in);
axis([-length(cha3in)/2 length(cha3in)/2 -2 2]);title('Channe 3 Input = Channe 3 Output');grid on;

subplot(6,1,4);stairs([-length(cha4out)/2+1/2:length(cha4out)/2-1/2],cha4out);
axis([-length(cha4out)/2 length(cha4out)/2 -2 2]);title('Channe 4 Input = Channe 4 Output');grid on;

subplot(6,1,5);stairs([-length(Parity)/2+1/2:length(Parity)/2-1/2],Parity);
axis([-length(Parity)/2 length(Parity)/2 -2 2]);title('Parity');grid on;

subplot(6,1,6);stairs([-length(Sereies)/2+1/2:length(Sereies)/2-1/2],Sereies);
axis([-length(Sereies)/2 length(Sereies)/2 -2 2]);title('Sereies Carrier');grid on;

%% Parallel to Series Optimum   O(n)

function Output = Par2SerOpt(Input, row_len, column_len)
    for column = 1:column_len
        Output(1, (column-1)*row_len+1:column*row_len) = Input(1:row_len, column);
    end
end

%% Series to Parallel Optimum   O(n)

function Output = Ser2ParOpt(Input, out_len)
    for row = 1:ceil(length(Input)/out_len)
        Output(1:out_len, row) = Input(1, (row-1)*out_len+1:row*out_len);    
    end
end