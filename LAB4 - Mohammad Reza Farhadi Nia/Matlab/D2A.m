%----------------------------------------------------------------------%
%%----------------- Lab 4 - Digital Communication --------------------%%
 %--------------- Supervisor: Dr.Shirvani Moghaddam --------------%
  %------- Source by Mohammad Reza Farhadi Nia ----- Date:Oct 2020 --%
%----------------------------------------------------------------------%

%% Main
%%%% At first time, you should run A2D then run D2A

t = [0:1/512:2*pi];
main_sig = 2.5*cos(t);

quants256new = bin2dec(Bytes);
signal = quants256new;

plot(t,main_sig,'x',t,quants256,'.')
legend('Original signal','Quantized signal');

% (Zooming a portion of figure in a figure)Code from https://ww2.mathworks.cn/matlabcentral/answers/33779-zooming-a-portion-of-figure-in-a-figure
axis([-.2 7 -3 3])
% create a new pair of axes inside current figure
axes('position',[.65 .175 .25 .25])
box on % put box around new pair of axes
indexOfInterest = (t < 11*pi/8) & (t > 9*pi/8); % range of t near perturbation
plot(t(indexOfInterest),signal(indexOfInterest),'r') % plot on new axes
axis tight
