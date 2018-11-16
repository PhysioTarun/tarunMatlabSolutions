function [output] = rectangulate(input,rows)
%RECTANGULATE Increases number of rows in input data by adding 
%   NaNs for the rest of data
%   Detailed explanation goes here

output = nan(rows,1);
output(1:length(input)) = input;

end

