%read in data from text file
data = readtable('OpenBCI-RAW-2019-10-17_15-15-58.txt');

%index out time and 
time=table2cell(data(:,21));
newTime = parseTime(time);

%parsedT = split(time, ':');
%sec = parsedT(:,3);
y = table2array(data(:,2:13));

%% Head 1 to 8 
counter=0;

for i = 1:8
    figure
    subplot(4,1,1);
    plot(newTime,y(:,i));
    title(sprintf('Raw Data - Head %.0f',i));
    xlabel('Time (s)')
    ylabel('EEG Signal')
    %set(gca,'xticklabel',time.')
    
    %bandpass filter from 5Hz to 50Hz at a Sampling Rate of 1000Hz a Second
    hold on
    bandhead=bandpass(y(:,i),[5 50],1000);
    subplot(4,1,2);
    plot(newTime,bandhead)
    title(sprintf('Band Pass - Head %.0f',i));
    xlabel('Time (s)');
    ylabel('EEG Signal')
    
    %Designing the Notch Filter for 60Hz  
    hold on
    d = designfilt('bandstopiir','FilterOrder',2,'HalfPowerFrequency1',59,'HalfPowerFrequency2',61,'DesignMethod','butter','SampleRate',1000);
    Notch = filtfilt(d,bandhead);
    subplot(4,1,3);
    plot(newTime,Notch);
    title(sprintf('Notch - Head %.0f',i));
    xlabel('Time (s)');
    ylabel('EEG Signal')
    
    %Power Density 
    Fs=1000;
    N=length(y(:,i));
    x=y(:,i);
    xdft = fft(x);
    xdft = xdft(1:N/2+1);
    psdx = (1/(Fs*N)) * abs(xdft).^2;
    psdx(2:end-1) = 2*psdx(2:end-1);
    feq=0:Fs/N:Fs/2;
    
    subplot(4,1,4);
    plot(feq,10*log10(psdx));
    title(sprintf('Power Density - Head %.0f',i));
    xlabel('Frequency')
    ylabel('Power Density')
    
    counter = counter+1;
    figurename=strcat(sprintf('Head %.0f',i),'.jpg');
    saveas(gcf,figurename);
end
%% Ear 9 to 12 
counter=0;

for i=9:12
    figure
    subplot(4,1,1);
    plot(newTime,y(:,i));
    title(sprintf('Raw Data - Ear %.0f',i));
    xlabel('Time (s)');
    ylabel('EEG Signal')
    %set(gca,'xticklabel',time.')
    
    %bandpass filter from 5Hz to 50Hz at a Sampling Rate of 1000Hz a Second
    hold on
    bandhead=bandpass(y(:,i),[5 50],1000);
    subplot(4,1,2);
    plot(newTime,bandhead)
    title(sprintf('Band Pass - Ear %.0f',i));
    xlabel('Time (s)');
    ylabel('EEG Signal')
    
    %Designing the Notch Filter for 60Hz  
    hold on
    d = designfilt('bandstopiir','FilterOrder',2,'HalfPowerFrequency1',59,'HalfPowerFrequency2',61,'DesignMethod','butter','SampleRate',1000);
    Notch = filtfilt(d,bandhead);
    subplot(4,1,3);
    plot(newTime,Notch);
    title(sprintf('Notch - Ear %.0f',i));
    xlabel('Time (s)');
    ylabel('EEG Signal')
    
    %Power Density 
    Fs=1000;
    N=length(y(:,i));
    x=y(:,i);
    xdft = fft(x);
    xdft = xdft(1:N/2+1);
    psdx = (1/(Fs*N)) * abs(xdft).^2;
    psdx(2:end-1) = 2*psdx(2:end-1);
    feq=0:Fs/N:Fs/2;
    
    subplot(4,1,4);
    plot(feq,10*log10(psdx));
    title(sprintf('Power Density - Ear %.0f',i));
    xlabel('Frequency')
    ylabel('Power Density')
    
    counter = counter+1;
    figurename=strcat(sprintf('Ear %.0f',i),'.jpg');
    saveas(gcf,figurename);
end