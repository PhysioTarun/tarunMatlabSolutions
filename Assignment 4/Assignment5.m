clear all

%%  Import Data from "isok_data_6803.csv" using "importfile" function

isokdata6803 = importfile('isok_data_6803.csv', 2, 26);

%%  Import each column as a separate vector 
%   Using the column headers as the variable names
%   Using the "importfile" function

SubjectID = isokdata6803.SubjectID;
Age = isokdata6803.Age;
Gender = isokdata6803.Gender;
Weight = isokdata6803.Weight;
Day1 = isokdata6803.Day1;
Day2 = isokdata6803.Day2;
Day3 = isokdata6803.Day3;

%%  Calculate Mean isometric strengths for:
%       Male (individual & Group)
%       Female (individual & Group)
%   Using "genderIsoCalc" function

[maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)


%%  Get Subject IDs for those who increaed strength on any consecutive days

day1toDay2 = dayComparator(SubjectID,Day1,Day2);
day2toDay3 = dayComparator(SubjectID,Day2,Day3);

%%  Weight normalize the isokinetic data and calculate the group means for each day

normDay1mean = mean(  (Day1 ./ Weight) * mean(Weight)  );
normDay2mean = mean(  (Day2 ./ Weight) * mean(Weight)  );
normDay3mean = mean(  (Day3 ./ Weight) * mean(Weight)  );

%%  Export results to a csvfile







