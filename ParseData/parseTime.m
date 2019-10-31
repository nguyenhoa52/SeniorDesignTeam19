function newtime = parseTime(time)

time=string(time);
parsedT = split(time, ':');

% convert sec
parsedT(:,3) = str2double(parsedT(:,3));

% convert min
parsedT(:,2) = str2double(parsedT(:,2))*60;

% convert hours to seconds
parsedT(:,1) = str2double(parsedT(:,1))*3600;

parsedT = str2double(parsedT);
mili = sum(parsedT,2);

timediff=diff(mili);
newtime = [0];

for i=1:length(timediff)
     newtime(i+1)=+ newtime(i) + timediff(i);
end
end
