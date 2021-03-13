%----------------------------------------------------------------------%
%%---- Final Project -- Optimum Version -- Digital Communication ----%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam ----------------%
  %----- Source by Mohammad Reza Farhadi Nia -- Date:6 Dec 2020 ----%
%--------------------------------------------------------------------%

%% Encoding
pnSequence1 = comm.PNSequence('Polynomial','x^9+x^5+1',...
    'SamplesPerFrame',1022,'InitialConditions',[0 0 0 0 0 0 0 0 1]);
Binary_Random_Input = pnSequence1();
[Binary_Random_Input(1:511) Binary_Random_Input(512:1022)]; %validity test

pnSequence2 = comm.PNSequence('Polynomial','x^9+x^5+1',...
    'BitPackedOutput',true,'NumPackedBits',4,...
    'SamplesPerFrame',127,'InitialConditions',[0 0 0 0 0 0 0 0 1]);
Hex_Random_Input = pnSequence2();
FourBinary = dec2bin(Hex_Random_Input(1:25));

DC_bias_tracked = zeros(3,10); %Row 3 is for checking 
Encoding = [];

%%
% 
% <<MMS.jpg>>
% 

    for i = 1:25
        
        switch Hex_Random_Input(i)
            
           case 0
               DC_bias_tracked(3,1) = DC_bias_tracked(3,1)+1;
               if DC_bias_tracked(1,1) == 0 && DC_bias_tracked(2,1) == 3
                   Encoding = [Encoding 1 0 1];
                   DC_bias_tracked(1,1) = ~DC_bias_tracked(1,1);
                   DC_bias_tracked(2,1) = 0;
               else
                   Encoding = [Encoding 0 -1 0];
                   DC_bias_tracked(2,1) = DC_bias_tracked(2,1) + 1;
                   DC_bias_tracked(1,1) = 0;
               end
               
           case 1
               Encoding = [Encoding 0 -1 1];

           case 2
               Encoding = [Encoding 1 -1 0];
               
           case 3
               DC_bias_tracked(3,2) = DC_bias_tracked(3,2)+1;
               if DC_bias_tracked(1,2) < 3
                   Encoding = [Encoding 0 0 1];
                   DC_bias_tracked(1,2) = DC_bias_tracked(1,2) + 1;
               else
                   Encoding = [Encoding -1 -1 0];
                   DC_bias_tracked(1,2) = 0;
               end     
               
           case 4
               Encoding = [Encoding -1 1 0];
               
           case 5    
               DC_bias_tracked(3,3) = DC_bias_tracked(3,3)+1;
               if DC_bias_tracked(1,3) == 0 && DC_bias_tracked(2,3) == 3
                   Encoding = [Encoding 0 1 1];
                   DC_bias_tracked(1,3) = ~DC_bias_tracked(1,3); 
                   DC_bias_tracked(2,3) = 0;
               else
                   Encoding = [Encoding -1 0 0];
                   DC_bias_tracked(2,3) = DC_bias_tracked(2,3) + 1;
                   DC_bias_tracked(1,3) = 0;
               end   
               
           case 6
               DC_bias_tracked(3,4) = DC_bias_tracked(3,4)+1;
               if DC_bias_tracked(1,4) < 2 
                   Encoding = [Encoding -1 1 1];
                   DC_bias_tracked(1,4) = DC_bias_tracked(1,4) + 1; 
               elseif DC_bias_tracked(2,4) < 2 && DC_bias_tracked(1,4) == 2
                   Encoding = [Encoding -1 -1 1];
                   DC_bias_tracked(2,4) = DC_bias_tracked(2,4) + 1;
               else
                   DC_bias_tracked(1,4) = 0;
                   DC_bias_tracked(2,4) = 0;
               end     
               
           case 7
               Encoding = [Encoding -1 0 +1]; 
               
           case 8
               DC_bias_tracked(3,5) = DC_bias_tracked(3,5)+1;
               DC_bias_tracked(1,5) < 3;        
               if DC_bias_tracked(1,5) == 1
                   Encoding = [Encoding 1 0 0];
                   DC_bias_tracked(1,5) = DC_bias_tracked(1,5) +1;
               else
                   Encoding = [Encoding 0 -1 -1];
                   DC_bias_tracked(1,5) = 0;
               end 
               
           case 9
               DC_bias_tracked(3,6) = DC_bias_tracked(3,6)+1;
               if DC_bias_tracked(1,6) < 3
                   Encoding = [Encoding 1 -1 1];
                   DC_bias_tracked(1,6) = DC_bias_tracked(1,6) +1;
               else
                   Encoding = [Encoding -1 -1 -1];
                   DC_bias_tracked(1,6) = 0;
               end  
               
           case 10 
               DC_bias_tracked(3,7) = DC_bias_tracked(3,7)+1;
               if DC_bias_tracked(1,7) < 2
                   Encoding = [Encoding 1 1 -1];
               elseif DC_bias_tracked(2,10) < 2 && DC_bias_tracked(1,10) == 2
                   Encoding = [Encoding 1 -1 -1];
                   DC_bias_tracked(2,10) = DC_bias_tracked(2,10) + 1;
               else
                   DC_bias_tracked(1,10) = 0;
                   DC_bias_tracked(2,10) = 0;
               end  
               
           case 11
               Encoding = [Encoding 1 0 -1];
  
           case 12 
               DC_bias_tracked(3,8) = DC_bias_tracked(3,8)+1;
               if DC_bias_tracked(1,8) == 0 && DC_bias_tracked(2,8) == 3
                   Encoding = [Encoding 1 1 1];
                   DC_bias_tracked(1,8) = ~DC_bias_tracked(1,8); 
                   DC_bias_tracked(2,8) = 0;
               else
                   Encoding = [Encoding -1 1 -1];
                   DC_bias_tracked(2,8) = DC_bias_tracked(2,8) + 1;
                   DC_bias_tracked(1,8) = 0;
               end  

           case 13  
               DC_bias_tracked(3,9) = DC_bias_tracked(3,9)+1;
               if DC_bias_tracked(1,9) < 3
                   Encoding = [Encoding 0 1 0];
                   DC_bias_tracked(1,9) = DC_bias_tracked(1,9) + 1;
               else
                   Encoding = [Encoding -1 0 -1];
                   DC_bias_tracked(1,9) = 0;
               end  
              
           case 14
               Encoding = [Encoding 0 1 -1];

 
           case 15 
               DC_bias_tracked(3,10) = DC_bias_tracked(3,10)+1;
               if DC_bias_tracked(1,10) == 0 && DC_bias_tracked(2,10) == 3
                   Encoding = [Encoding 1 1 0];
                   DC_bias_tracked(1,10) = ~DC_bias_tracked(1,10); 
                   DC_bias_tracked(2,10) = 0;
               else
                   Encoding = [Encoding 0 0 -1];
                   DC_bias_tracked(2,10) = DC_bias_tracked(2,10) + 1;
                   DC_bias_tracked(1,10) = 0;
               end  
        end
    end

%% Decoding
% Most Important Code with Trick
ThreeTernary = join(string(reshape(Encoding,3,[]))'); % & HEAVY DEBUGING :)))  
Decoding = [];

%%
% 
% <<Decode.jpg>>
% 

    for i = 1:25
        
        switch ThreeTernary(i)
            
           case {'1 0 1' , '0 -1 0'} 
               Decoding = [Decoding 0 0 0 0];
  
           case {'0 -1 1'}
               Decoding = [Decoding 0 0 0 1];
               
           case {'1 - 0'}
               Decoding = [Decoding 0 0 1 0];   
               
           case {'0 0 1' , '-1 -1 0'}
               Decoding = [Decoding 0 0 1 1];    
               
           case {'-1 1 0'}
               Decoding = [Decoding 0 1 0 0];  
               
           case {'0 1 1' , '-1 0 0'}
               Decoding = [Decoding 0 1 0 1];  
               
           case {'-1 1 1' , '-1 -1 1'}
               Decoding = [Decoding 0 1 1 0];    
               
           case {'-1 0 1'}
               Decoding = [Decoding 0 1 1 1];  
               
           case {'1 0 0' , '0 -1 -1'}
               Decoding = [Decoding 1 0 0 0];
               
           case {'1 -1 1' , '-1 -1 -1'}
               Decoding = [Decoding 1 0 0 1]; 
               
           case {'1 1 -1' , '1 -1 -1'}       
               Decoding = [Decoding 1 0 1 0];
               
           case {'1 0 -1'}    
               Decoding = [Decoding 1 0 1 1];
  
           case {'1 1 1' , '-1 1 -1'}      
               Decoding = [Decoding 1 1 0 0];

           case {'0 1 0' , '-1 0 -1'}
               Decoding = [Decoding 1 1 0 1];
     
           case {'0 1 -1'}
               Decoding = [Decoding 1 1 1 0];
     
           case {'1 1 0' , '0 0 -1'}
               Decoding = [Decoding 1 1 1 1];

        end
    end
    
 %% Plot
figure

subplot(3,1,1);stairs([-length(Binary_Random_Input(1:100))/2+1/2:length(Binary_Random_Input(1:100))/2-1/2],Binary_Random_Input(1:100));
axis([-length(Binary_Random_Input(1:100))/2 length(Binary_Random_Input(1:100))/2 -2 2]);title('Input Binary code');grid on;

subplot(3,1,2);stairs([-length(Encoding)/2+1/2:length(Encoding)/2-1/2],Encoding, 'r');
axis([-length(Encoding)/2 length(Encoding)/2 -2 2]);title('4-B 3-T Optimum Coding');grid on;  

subplot(3,1,3);stairs([-length(Decoding)/2+1/2:length(Decoding)/2-1/2],Decoding,'green');
axis([-length(Decoding)/2 length(Decoding)/2 -2 2]);title('Decoding');grid on;
