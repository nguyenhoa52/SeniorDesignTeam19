%open text file and make it a matlab table
data = readtable('Sub3_data.txt');
%remove first row
data(1,:) = [];
%remove quotes from the time 
time=table2cell(data(:,1));
time(:,1)=cellfun(@str2double,time(:,1),'un',0);
time=cell2mat(time(:,1));

y = table2array(data(:,2:32));
% plot all 31 
figure 
for i = 1:31
    plot(time,y(:,i));
    hold on
    legend('Channel 1')
end

%plot(time,y(:,18))
%hold on
%var2=bandpass(y(:,18),[5 50],1000);
%plot(time,var2)
xlabel('Time')
ylabel('EEG Signal')