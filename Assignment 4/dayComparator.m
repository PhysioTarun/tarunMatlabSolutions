function [increamentIDs] = dayComparator(subjectID,day1,day2)
%DAYCOMPARATOR takes the subject IDs and two days as inputs and returns a 
%   matrix with the subject IDs of the subjects who had an increase from
%   the first day to the second day
%   Detailed explanation goes here

j=0;                            % Initialize counter 
for i = 1:length(subjectID)     % Loop for running through all data rows
    if day2(i) > day1(i)        
        j = j + 1;
        increamentIDs(j,1) = subjectID(i);
end










end

