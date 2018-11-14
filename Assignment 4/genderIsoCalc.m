function [maleIso,femaleIso,maleGroup,femaleGroup] = genderIsoCalc(gender,day1,day2,day3)
%GENDERISOCALC takes the Gender & three different day's strength data as
%   input. It then gives four outputs: individual means of three days data 
%   for both males and females; And mean of all days for males and females.
   
m = 0; f = 0; % Initialize counters for male and female vectors

for i = 1:length(gender)    % Run loop for checking each data row
    if gender(i) == 'M'
        m = m+1;            % If "M" is found - increament counter
        maleIso(m) = ( day1(i) + day2(i) + day3(i) )/3; % Calculate average for each male subject for all three days; add to "maleIso" vector in the end
    else
        f = f+1;            % If "F" is found - increament counter
        femaleIso(f) = ( day1(i) + day2(i) + day3(i) )/3; % Calculate average for each female subject for all three days
    end
end

maleGroup = sum(maleIso) / m;       % Calculate Mean of all Males Data by dividing by total number of "M" data found (using counter "m")
femaleGroup = sum(femaleIso) / f;   % Calculate Mean of all Females Data by dividing by total number of "F" data found (using counter "f")

end

