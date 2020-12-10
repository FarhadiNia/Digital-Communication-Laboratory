%----------------------------------------------------------------------%
%%------------------ Lab 1 Digital Communication --------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Oct 2020 --%
%----------------------------------------------------------------------%
%Description: Also We could use "cat" function
%%
%series input
a  = randi([0 1],1,256)

%parallel input
b  = Ser2Par(a, 8)
bb = Ser2ParOpt(a, 8)

%convertion p-p
C  = Par2Ser(b, 8, 32)
CC = Par2SerOpt(bb, 8, 32)
D  = Ser2Par(C, 4)
DD = Ser2ParOpt(CC, 4)

%convertion s-s
E  = Ser2Par(a, 16)
EE = Ser2ParOpt(a, 16)
F  = Par2Ser(E, 16, 16)
FF = Par2SerOpt(EE, 16, 16)

%% Series to Parallel             O(n)

function Output = Ser2Par(Input, out_len)
    i=1;
    for j = 0:length(Input)-1
        Output(mod(j,out_len)+1,i) = Input(1,j+1);
        if mod(j,out_len)+1 == out_len
            i = i+1;
        end        
    end
end

%% Series to Parallel Optimum   O(n)

function Output = Ser2ParOpt(Input, out_len)
    for row = 1:ceil(length(Input)/out_len)
        Output(1:out_len, row) = Input(1, (row-1)*out_len+1:row*out_len);      
    end
end

%% Parallel to Series             O(n^2)

function Output = Par2Ser(Input, row_len, column_len)
    i = 1;
    for column = 1:column_len
        for row = 1:row_len
            Output(1, i) = Input(row, column);
            i = i+1;
        end
    end
end

%% Parallel to Series Optimum   O(n)

function Output = Par2SerOpt(Input, row_len, column_len)
    for column = 1:column_len
        Output(1, (column-1)*row_len+1:column*row_len) = Input(1:row_len, column);
    end
end
