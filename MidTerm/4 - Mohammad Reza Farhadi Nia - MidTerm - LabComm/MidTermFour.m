%----------------------------------------------------------------------%
%%-------------- Exam Mid-Term 4 Digital Communication ------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam ---------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Nov 2020 --%
%----------------------------------------------------------------------%
%%

a = randi([0 1],1,1024)
b = Ser2ParOpt(a, 8)
b_with_zero = Ser2ParOptZ(a, 8)
c = Par2SerOpt(b_with_zero, 8, 128)


%% Series to Parallel Optimum O(n)

function Output = Ser2ParOpt(Input, out_len)
    for row = 1:ceil(length(Input)/out_len)
        Output(1:out_len, row) = Input(1, (row-1)*out_len+1:row*out_len);
    end
end

%% Series to Parallel Optimum + Zero O(n)

function Output = Ser2ParOptZ(Input, out_len)
    for row = 1:ceil(length(Input)/out_len)
        Output(1:out_len, row) = Input(1, (row-1)*out_len+1:row*out_len);
        Output(out_len+1, row) = 0;
    end
end

%% Parallel to Series Optimum   O(n)

function Output = Par2SerOpt(Input, row_len, column_len)
    for column = 1:column_len
        Output(1, (column-1)*row_len+1:column*row_len) = Input(1:row_len, column);
    end
end
