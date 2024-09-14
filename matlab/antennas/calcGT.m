%% Calculate Gain-to-Noise Temperature (G/T)
% Author:   Tim Holden
% Date:     May 11, 2024
% MATLAB:   2024a
% Version:  1

%% Create the frequency dependent atmospheric attenuation coefficient (a,b,c) lookup table
% These were taken from the "handbook for estimation of microwave propagation effects...pdf

% Create Array of Microwave Frequencies
freqs = 1:0.1:41;
freqsCol = freqs';

% Create the frequency and coefficient table and convert to array
coeffArray = [1 3.3446e02 2.7551e-06 1.1189e-04;
              2	3.6196e-02	2.7567e-06	1.3327e-04;
              4	3.9669e-02	2.7599e-04	1.7620e-04;
              6	4.0448e-02	6.5086e-04	1.9645e-04;
              12 4.3596e-02	3.1768e-03	3.1470e-04;
              15 4.6138e-02	6.3384e-03	4.5527e-04;
              16 4.7195e-02	8.2112e-03	5.3568e-04;
              20 5.6047e-02	3.4557e-02	1.5508e-03;
              22 7.5989e-02	7.8251e-02	3.0978e-03;
              24 6.9102e-02	5.9116e-02	2.4950e-03;
              30 8.5021e-02	2.3728e-02	1.3300e-03;
              35 1.2487e-01	2.3681e-02	1.4860e-03;
              41 2.3683e-01	2.8402e-02	2.1127e-03];
%coeffArray = table2array(readtable('atmos_atten.csv'));

% Calculate the number of points the diff will be applied to for averaging
count1to2 = ((2-1)/0.1)-1;
count2to4 = ((4-2)/0.1)-2;
count4to6 = ((6-4)/0.1)-2;
count6to12 = ((12-6)/0.1)-6;
count12to15 = ((15-12)/0.1)-3;
count15to16 = ((16-15)/0.1)-1;
count16to20 = ((20-16)/0.1)-4;
count20to22 = ((22-20)/0.1)-2;
count22to24 = ((24-22)/0.1)-2;
count24to30 = ((30-24)/0.1)-6;
count30to35 = ((35-30)/0.1)-5;
count35to41 = ((41-35)/0.1)-6;

% Create frequency dependent coefficients for a
aDiff1to2 = (coeffArray(2,2)-coeffArray(1,2))/count1to2;
aDiff2to4 = (coeffArray(3,2)-coeffArray(2,2))/count2to4;
aDiff4to6 = (coeffArray(4,2)-coeffArray(3,2))/count4to6;
aDiff6to12 = (coeffArray(5,2)-coeffArray(4,2))/count6to12;
aDiff12to15 = (coeffArray(6,2)-coeffArray(5,2))/count12to15;
aDiff15to16 = (coeffArray(7,2)-coeffArray(6,2))/count15to16;
aDiff16to20 = (coeffArray(8,2)-coeffArray(7,2))/count16to20;
aDiff20to22 = (coeffArray(9,2)-coeffArray(8,2))/count20to22;
aDiff22to24 = (coeffArray(10,2)-coeffArray(9,2))/count22to24;
aDiff24to30 = (coeffArray(11,2)-coeffArray(10,2))/count24to30;
aDiff30to35 = (coeffArray(12,2)-coeffArray(11,2))/count30to35;
aDiff35to41 = (coeffArray(13,2)-coeffArray(12,2))/count35to41;

% Create a column vector of coefficients for a
aCoeff = [aDiff1to2;aDiff2to4;aDiff4to6;aDiff6to12;aDiff12to15;aDiff15to16;aDiff16to20;aDiff20to22;...
          aDiff22to24;aDiff24to30;aDiff30to35;aDiff35to41];

% Create frequency dependent coefficients for b
bDiff1to2 = (coeffArray(2,3)-coeffArray(1,3))/count1to2;
bDiff2to4 = (coeffArray(3,3)-coeffArray(2,3))/count2to4;
bDiff4to6 = (coeffArray(4,3)-coeffArray(3,3))/count4to6;
bDiff6to12 = (coeffArray(5,3)-coeffArray(4,3))/count6to12;
bDiff12to15 = (coeffArray(6,3)-coeffArray(5,3))/count12to15;
bDiff15to16 = (coeffArray(7,3)-coeffArray(6,3))/count15to16;
bDiff16to20 = (coeffArray(8,3)-coeffArray(7,3))/count16to20;
bDiff20to22 = (coeffArray(9,3)-coeffArray(8,3))/count20to22;
bDiff22to24 = (coeffArray(10,3)-coeffArray(9,3))/count22to24;
bDiff24to30 = (coeffArray(11,3)-coeffArray(10,3))/count24to30;
bDiff30to35 = (coeffArray(12,3)-coeffArray(11,3))/count30to35;
bDiff35to41 = (coeffArray(13,3)-coeffArray(12,3))/count35to41;

% Create a column vector of coefficients for b
bCoeff = [bDiff1to2;bDiff2to4;bDiff4to6;bDiff6to12;bDiff12to15;bDiff15to16;bDiff16to20;bDiff20to22;...
          bDiff22to24;bDiff24to30;bDiff30to35;bDiff35to41];

% Create frequency dependent coefficients for c
cDiff1to2 = (coeffArray(2,4)-coeffArray(1,4))/count1to2;
cDiff2to4 = (coeffArray(3,4)-coeffArray(2,4))/count2to4;
cDiff4to6 = (coeffArray(4,4)-coeffArray(3,4))/count4to6;
cDiff6to12 = (coeffArray(5,4)-coeffArray(4,4))/count6to12;
cDiff12to15 = (coeffArray(6,4)-coeffArray(5,4))/count12to15;
cDiff15to16 = (coeffArray(7,4)-coeffArray(6,4))/count15to16;
cDiff16to20 = (coeffArray(8,4)-coeffArray(7,4))/count16to20;
cDiff20to22 = (coeffArray(9,4)-coeffArray(8,4))/count20to22;
cDiff22to24 = (coeffArray(10,4)-coeffArray(9,4))/count22to24;
cDiff24to30 = (coeffArray(11,4)-coeffArray(10,4))/count24to30;
cDiff30to35 = (coeffArray(12,4)-coeffArray(11,4))/count30to35;
cDiff35to41 = (coeffArray(13,4)-coeffArray(12,4))/count35to41;

% Create a column vector of coefficients for c
cCoeff = [cDiff1to2;cDiff2to4;cDiff4to6;cDiff6to12;cDiff12to15;cDiff15to16;cDiff16to20;cDiff20to22;...
          cDiff22to24;cDiff24to30;cDiff30to35;cDiff35to41];

%% Create frequency to coefficient correlation array

% Create placeholder columns to concatenate freq and coeff cols
a = zeros(numel(freqsCol),1);
b = zeros(numel(freqsCol),1);
c = zeros(numel(freqsCol),1);
atmosMat = [freqsCol a b c];

% Fill Matrix with appropriate values
for i = 1:numel(freqsCol)
    if freqsCol(i) == 1.0
        atmosMat(i,2) = coeffArray(1,2);
        atmosMat(i,3) = coeffArray(1,3);
        atmosMat(i,4) = coeffArray(1,4);
    elseif freqsCol(i) >= 1.1 && freqsCol(i) < 2.0
        atmosMat(i,2) = atmosMat(i-1,2) + aCoeff(1,1);
        atmosMat(i,3) = atmosMat(i-1,3) + bCoeff(1,1);
        atmosMat(i,4) = atmosMat(i-1,4) + cCoeff(1,1);
    elseif freqsCol(i) == 2.0
        atmosMat(i,2) = coeffArray(2,2);
        atmosMat(i,3) = coeffArray(2,3);
        atmosMat(i,4) = coeffArray(2,4);
    elseif freqsCol(i) >= 2.1 && freqsCol(i) < 4.0
        atmosMat(i,2) = atmosMat(i-1,2) + aCoeff(2,1);
        atmosMat(i,3) = atmosMat(i-1,3) + bCoeff(2,1);
        atmosMat(i,4) = atmosMat(i-1,4) + cCoeff(2,1);
    elseif freqsCol(i) == 4.0
        atmosMat(i,2) = coeffArray(3,2);
        atmosMat(i,3) = coeffArray(3,3);
        atmosMat(i,4) = coeffArray(3,4);
    elseif freqsCol(i) >= 4.1 && freqsCol(i) < 6.0
        atmosMat(i,2) = atmosMat(i-1,2) + aCoeff(3,1);
        atmosMat(i,3) = atmosMat(i-1,3) + bCoeff(3,1);
        atmosMat(i,4) = atmosMat(i-1,4) + cCoeff(3,1);
    elseif freqsCol(i) == 6.0
        atmosMat(i,2) = coeffArray(4,2);
        atmosMat(i,3) = coeffArray(4,3);
        atmosMat(i,4) = coeffArray(4,4);
    elseif freqsCol(i) >= 6.1 && freqsCol(i) < 12.0
        atmosMat(i,2) = atmosMat(i-1,2) + aCoeff(4,1);
        atmosMat(i,3) = atmosMat(i-1,3) + bCoeff(4,1);
        atmosMat(i,4) = atmosMat(i-1,4) + cCoeff(4,1);
    elseif freqsCol(i) == 12.0
        atmosMat(i,2) = coeffArray(5,2);
        atmosMat(i,3) = coeffArray(5,3);
        atmosMat(i,4) = coeffArray(5,4);
    elseif freqsCol(i) >= 12.1 && freqsCol(i) < 15.0
        atmosMat(i,2) = atmosMat(i-1,2) + aCoeff(5,1);
        atmosMat(i,3) = atmosMat(i-1,3) + bCoeff(5,1);
        atmosMat(i,4) = atmosMat(i-1,4) + cCoeff(5,1);
    elseif freqsCol(i) == 15.0
        atmosMat(i,2) = coeffArray(6,2);
        atmosMat(i,3) = coeffArray(6,3);
        atmosMat(i,4) = coeffArray(6,4);
    elseif freqsCol(i) >= 15.1 && freqsCol(i) < 16.0
        atmosMat(i,2) = atmosMat(i-1,2) + aCoeff(6,1);
        atmosMat(i,3) = atmosMat(i-1,3) + bCoeff(6,1);
        atmosMat(i,4) = atmosMat(i-1,4) + cCoeff(6,1);
    elseif freqsCol(i) == 16.0
        atmosMat(i,2) = coeffArray(7,2);
        atmosMat(i,3) = coeffArray(7,3);
        atmosMat(i,4) = coeffArray(7,4);
    elseif freqsCol(i) >= 16.1 && freqsCol(i) < 20.0
        atmosMat(i,2) = atmosMat(i-1,2) + aCoeff(7,1);
        atmosMat(i,3) = atmosMat(i-1,3) + bCoeff(7,1);
        atmosMat(i,4) = atmosMat(i-1,4) + cCoeff(7,1);
    elseif freqsCol(i) == 20.0
        atmosMat(i,2) = coeffArray(8,2);
        atmosMat(i,3) = coeffArray(8,3);
        atmosMat(i,4) = coeffArray(8,4);
    elseif freqsCol(i) >= 20.1 && freqsCol(i) < 22.0
        atmosMat(i,2) = atmosMat(i-1,2) + aCoeff(8,1);
        atmosMat(i,3) = atmosMat(i-1,3) + bCoeff(8,1);
        atmosMat(i,4) = atmosMat(i-1,4) + cCoeff(8,1);
    elseif freqsCol(i) == 22.0
        atmosMat(i,2) = coeffArray(9,2);
        atmosMat(i,3) = coeffArray(9,3);
        atmosMat(i,4) = coeffArray(9,4);
    elseif freqsCol(i) >= 22.1 && freqsCol(i) < 24.0
        atmosMat(i,2) = atmosMat(i-1,2) + aCoeff(9,1);
        atmosMat(i,3) = atmosMat(i-1,3) + bCoeff(9,1);
        atmosMat(i,4) = atmosMat(i-1,4) + cCoeff(9,1);
    elseif freqsCol(i) == 24.0
        atmosMat(i,2) = coeffArray(10,2);
        atmosMat(i,3) = coeffArray(10,3);
        atmosMat(i,4) = coeffArray(10,4);
    elseif freqsCol(i) >= 24.1 && freqsCol(i) < 30.0
        atmosMat(i,2) = atmosMat(i-1,2) + aCoeff(10,1);
        atmosMat(i,3) = atmosMat(i-1,3) + bCoeff(10,1);
        atmosMat(i,4) = atmosMat(i-1,4) + cCoeff(10,1);
    elseif freqsCol(i) == 30.0
        atmosMat(i,2) = coeffArray(11,2);
        atmosMat(i,3) = coeffArray(11,3);
        atmosMat(i,4) = coeffArray(11,4);
    elseif freqsCol(i) >= 30.1 && freqsCol(i) < 35.0
        atmosMat(i,2) = atmosMat(i-1,2) + aCoeff(11,1);
        atmosMat(i,3) = atmosMat(i-1,3) + bCoeff(11,1);
        atmosMat(i,4) = atmosMat(i-1,4) + cCoeff(11,1);
    elseif freqsCol(i) == 35.0
        atmosMat(i,2) = coeffArray(12,2);
        atmosMat(i,3) = coeffArray(12,3);
        atmosMat(i,4) = coeffArray(12,4);
    elseif freqsCol(i) >= 35.1 && freqsCol(i) < 41.0
        atmosMat(i,2) = atmosMat(i-1,2) + aCoeff(12,1);
        atmosMat(i,3) = atmosMat(i-1,3) + bCoeff(12,1);
        atmosMat(i,4) = atmosMat(i-1,4) + cCoeff(12,1);
    elseif freqsCol(i) == 41.0
        atmosMat(i,2) = coeffArray(13,2);
        atmosMat(i,3) = coeffArray(13,3);
        atmosMat(i,4) = coeffArray(13,4);
    end
end

%% Clear out the workspace

% Clear workspace of individual calculations
clear aDiff1to2 aDiff2to4 aDiff4to6 aDiff6to12 aDiff12to15 aDiff15to16 aDiff16to20 aDiff20to22 ...
    aDiff22to24 aDiff24to30 aDiff30to35 aDiff35to41

clear bDiff1to2 bDiff2to4 bDiff4to6 bDiff6to12 bDiff12to15 bDiff15to16 bDiff16to20 bDiff20to22 ...
    bDiff22to24 bDiff24to30 bDiff30to35 bDiff35to41

clear cDiff1to2 cDiff2to4 cDiff4to6 cDiff6to12 cDiff12to15 cDiff15to16 cDiff16to20 cDiff20to22 ...
    cDiff22to24 cDiff24to30 cDiff30to35 cDiff35to41

clear count1to2 count2to4 count4to6 count6to12 count12to15 count15to16 count16to20 count20to22 ...
    count22to24 count24to30 count30to35 count35to41 

clear freqs a b c i aCoeff bCoeff cCoeff coeffArray freqsCo

%% Acquire Solar Flux Data From NOAA and save to current Directory
filename = "noaa_solar_flux_data_" + string(datetime('today'), "MM-dd-yyyy") + ".txt";
url = "https://services.swpc.noaa.gov/text/current-space-weather-indices.txt";
fluxData = websave(filename,url);

sfyn = input("Would you like to pull the current Solar Flux Data (y/n): \n", "s");
if sfyn == "y"
    winopen(fluxData)
end
fprintf("\n")
clear sfyn ; clc

%% Create a dialog box for user-defined input to be used in calculations
prompt = {'Enter Diameter of the antenna in meters:',...
          'Enter each of your the elevation angle separated by commas in units of degrees:'...
          'Enter the relative humidity as a percentage in decimal format (e.g., 40% = 0.4):'...
          'Enter the local temperature in degrees celcius:'...
          'Enter the altitude of the antenna in meters'...
          'Enter the frequency for which you wish to calculate G/T in MHz (e.g., 4.2 GHz = 4200 MHz:'...
          'Enter the solar flux frequency from the NOAA data below but closest to your G/T frequency:',...
          'Enter the value correlating to the frequency you just entered for the location nearest you:',...
          'Enter the value correlating to the frequency you just entered for the second closest location nearest you',...
          'Enter the solar flux frequency from the NOAA data above but closest to your G/T frequency:',...
          'Enter the value correlating to the frequency you just entered for the location nearest you:',...
          'Enter the value correlating to the frequency you just entered for the second closest location nearest you',...
          'Enter each of your measured P_{sun} values separated by commas:',...
          'Enter each of your measured P_{sky} values separated by commas:',...
          'Enter the desired filename for the exported CSV formatted data containing calculations:'};
dlgtitle = 'User-defined values for calculating G/T using the sun as an RF source';
dims = [1 100;1 100;1 100;1 100;1 100;1 100;1 100;1 100;1 100;1 100;1 100;1 100;1 100;1 100;1 100;];
definput = {'','','','','','','','','','','','','','','',};
opts.Interpreter = 'tex';
opts.Resize = 'on';
userInput = inputdlg(prompt,dlgtitle,dims,definput,opts);

%% Convert the elevation angle values to an array of double precision values
elAngVals = strtrim(strsplit(userInput{2},','));
elAngle = [];
for val = elAngVals
    elAngle = str2double(elAngVals);
end

%% Convert the Psun values to an array of double precision values
pSunVals = strtrim(strsplit(userInput{13},','));
Psun = [];
for val = pSunVals
    Psun = str2double(pSunVals);
end

%% Convert the Psky values to an array of double precision values
pSkyVals = strtrim(strsplit(userInput{14},','));
pSky = [];
for val = pSkyVals
    Psky = str2double(pSkyVals);
end

%% Calculate Pdelta values from Psun and Psky arrays
Pdelta = ones(1,length(Psun));
for i = 1:length(Psun)
    Pdelta(i) = abs(Psun(i) - Psky(i));
end

%% The value y is an array correlating to the linearized Pdelta
y = ones(1,length(Pdelta));
for i = 1:length(Pdelta)
    y(i) = 10^(Pdelta(i)/10);
end

%% Key Variables and Parameters
D = str2double(userInput{1});
RH = str2double(userInput{3});
tempC = str2double(userInput{4});
altitude = str2double(userInput{5});
fgt = str2double(userInput{6})*10^6;
f1 = str2double(userInput{7})*10^6;
fm1 = mean([str2double(userInput{8}) str2double(userInput{9})]);
f2 = str2double(userInput{10})*10^6;
lambda = physconst('LightSpeed')/fgt;
hpbw = 0;
if D <= 3.7
    hpbw = 68*(lambda/D);
elseif D < 5.4
    hpbw = 59*(lambda/D);
elseif D >= 5.4
    hpbw = 65.9*(lambda/D);
end

r = 0.525*(1.24-0.162*log10(fgt*10^9));
k = physconst('Boltzmann');
Ie = log10(fgt/f2)/log10(f1/f2);
So = (fm2*((fm1/fm2)^Ie))*10^-22;
lambdaSq = lambda^2;
C37 = (1-exp((-(r/hpbw)^2*log10(2))))/((r/hpbw)^2*log10(2));
x = 0.533/hpbw;
j1 = besselj(1,1.616*x,1);
j2 = besselj(0,1.616*x,1);
C = 1/((1.616*x)^2/4*(1-j1^2-j2^2));
tempK = tempC + 273.15;

%% The following calculates the atmospheric attenuation
idx = find(round(atmosMat(:,1),1)==round(fgt/1e9,1));
a = atmosMat(idx,2);
b = atmosMat(idx,3);
c = atmosMat(idx,4);

%% Calculation of absolute humidity using user-defined relative humidity (RH)
A = 6.116441;
m = 7.591386;
Tn = 240.7263;
Pws = A*10^((m*tempC)/(tempC+Tn));
Pw = (Pws/100)*(RH*100);
AH = 2.16679*(Pw/tempK);
alpha5deg = (1/sind(5.0))*(a + b*AH - c*tempC);
alphaLinear5deg = 10^alpha5deg;

%% The following is a G/T array for each Psun-Psky pair
alpha = ones(1,length(y));
alphaLinear = ones(1,length(y));
GT = ones(1,length(y));
GTat5deg = ones(1,length(y));
if D < 5
    for i = 1:length(y)
        alpha(i) = (1/sind(elAngle(i)))*(a + b*AH - c*tempC);
        alphaLinear(i) = 10^(alpha(i)/10);
        GT(i) = 10*log10((8*pi*k*(y(i)-1))/(So*lambdaSq*C37*alphaLinear));
        GTat5deg(i) = 10*log10((8*pi*k*(y(i)-1))/(So*lambdaSq*C37*alphaLinear5deg));
    end
elseif D < 5.4
    for i = 1:length(y)
        alpha(i) = (1/sind(elAngle(i)))*(a + b*AH - c*tempC);
        alphaLinear(i) = 10^(alpha(i)/10);
        GT(i) = 10*log10((8*pi*k*(y(i)-1))/(So*lambdaSq*C*alphaLinear));
        GTat5deg(i) = 10*log10((8*pi*k*(y(i)-1))/(So*lambdaSq*C*alphaLinear5deg));
    end
elseif D >= 5.4
    for i = 1:length(y)
        alpha(i) = (1/sind(elAngle(i)))*(a + b*AH - c*tempC);
        alphaLinear(i) = 10^(alpha(i)/10);
        f = fgt/1e9;
        AL = f^4/1818 - f^3/23.348 + 1.22*f^2 - 2.66*f + 11.43;
        d = 0.533*10^(1/AL);
        a0 = 0;
        a1 = -1.19057e-9;
        a2 = -7.00405e-12;
        a3 = 1.63224e-14;
        a4 = -1.41043e-13;
        a5 = 0;
        a6 = 16.00668;
        a7 = -82.80175;
        a8 = 179.98678;
        a9 = -83.37612;
        k2 = a0*d*f^2 + a1*f^3 + a2*f^2 + a3*f + a4*d*f + a5*d^2*f + a6 + a7*d + a8*d^2 + a9*d^3;
        GT(i) = 10*log10((8*pi*k*(y(i)-1))/(So*lambdaSq*(1/k2)*alphaLinear));
        GTat5deg(i) = 10*log10((8*pi*k*(y(i)-1))/(So*lambdaSq*(1/k2)*alphaLinear5deg));
    end
end

%% The following will output the average G/T for all calculated values and G/T per Psun-Psky pair
avgGT = mean(GT);
avgGTat5deg = mean(GTat5deg);

%% Generate the output table to review the results and write to local CSV file
sz1 = [length(GT) 11];
varTypes1 = ["double","double","double","double","double","double","double","double","double","double","double"];
varNames1 = ["Antenna Diameter (D)", "Frequency (GHz)", "El Angle", "Absolute Humidity (g/m^3)",...
             "Surface Temp (C)", "Altitude (m)", "Psun", "Psky", "Pdelta (dB)", "Pdelta (linear)", "G/T"];
gtTable1 = Table('Size', sz1, 'VariableTypes', varTypes1, 'VariableNames', varNames1);
for i = 1:length(GT)
    gtTable(i,:) = {D, fgt, elAngle(i), AH, tempC, altitude, Psun(i), Psky(i), Pdelta(i), y(i), GT(i)};
end

disp(gtTable1)
fprintf('\n')
disp("The average G/T value is: " + num2str(avgGT) + " dB/K")
fprintf('\n')
disp("The average G/T value at 5 degrees is: " + num2str(avgGTat5deg) + " dB/K")
fprintf('\n')

filename = string(userInput{15} + ".csv");
writetable(gtTable1,filename);
