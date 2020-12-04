%----------------------------------------------------------------------%
%%------------------ Lab 1 Digital Communication --------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Oct 2020 --%
%----------------------------------------------------------------------%
%Description: Also We coud use "cat" function
%%
a   = randi([0 1],1,256)

b1  = Ser2Par(a, 4)
b11 = Ser2ParOpt(a, 4)

b2  = Ser2Par(a, 8)
b22 = Ser2ParOpt(a, 8)

b3  = Ser2Par(a, 16)
b33 = Ser2ParOpt(a, 16)

b4  = Ser2Par(a, 32)
b44 = Ser2ParOpt(a, 32)

c1  = Par2Ser(b1, 4, 64)
c11 = Par2SerOpt(b11, 4, 64)

c2  = Par2Ser(b2, 8, 32)
c22 = Par2SerOpt(b22, 8, 32)

c3  = Par2Ser(b3, 16, 16)
c33 = Par2SerOpt(b33, 16, 16)

c4  = Par2Ser(b4, 32, 8)
c44 = Par2SerOpt(b44, 32, 8)

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
