%----------------------------------------------------------------------%
%%----------------- Lab 4 - Digital Communication --------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Oct 2020 --%
%----------------------------------------------------------------------%

%% Main
%%%% for 100kHz sure enough change 100 to 100000
%%% It is intentionally changed to show more better
f  = 100;
fs = 51200;

t1  = (0:1/f:0.5);
t2  = (0:f/fs:0.5);

y1 = 2.5*cos(2*pi*t1);  
y2 = 2.5*cos(2*pi*t2); 

figure

 subplot(2,1,1);
 plot(t1,y1,'k')
 xlabel('T'); ylabel('x(t)'); title('Input signal')

 subplot(2,1,2);      
 stem(t2,y2); hold on;
 plot(t2,y2,'r'); hold off;
 xlabel('T'); ylabel('y(t)'); title('Output sequence')
 
%% Quantization
%%%% for 256 pices sure enough change 8 to 256
%%% It is intentionally changed to show more better
figure
t = [0:1/16:2*pi]; % Times at which to sample the sine function
sig = 2.5*cos(t);  % Original signal, a sine wave
partition = [-2.5:5/8:2.5]; 
codebook = [-2.5:5/8:3.125]; 
[index8,quants8] = quantiz(sig,partition,codebook); % Quantize.
plot(t,sig,'x',t,quants8,'.')
legend('Original signal','Quantized signal');
axis([-.2 7 -3 3])

%% Byte
t = [0:1/512:2*pi];
sig = 2.5*cos(t);
partition256 = [-2.5:5/256:2.5]; 
codebook1256 = [-2.5:5/256:2.5196]; 
[index246,quants256] = quantiz(sig,partition256,codebook1256);

Bytes = dec2bin(index246)