%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment 2: Chapter 1, 2 & 3 Exercises
%
% Submitted by: Tarun K Singh
%
% Due: September 13, 2018
%
% Instructions: 
% Create a new m-file in MATLAB and save your answers in it. At the top of
% your file, you should have a comment section with your name, the 
% due date, and a brief description of what is contained in the file.
% This will be the standard format going forward for your assignments. 
% Exercises can be found at the ends of Chapters 1, 2 and 3 in your
% textbook.
% If there are not comments please write your answer with correct 
% matlab syntax. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Chapter 1 Exercises

% 1.)
atmWeightCu = 63.55

% 2.)
myage = 36
myage - 2
myage + 1

% 3.)
namelenhmax % Gives ans = 63

% 4.)
weigthPound = 50
weigthOunce = 800
who
whos
clear weigthPound
who
whos

% 5.)
intmin('unint32')   % 0
intmax('unint32')   % 4294967295
intmin('unint64')   % 0
intmax('unint64')   % 18446744073709551615

% 6.)
var = 3.14
var = int32(var)

% 11.)
pounds = 190
kilos = pounds / 2.2

% 12.)
ftemp = 77
ctemp = (ftemp - 32) * (5/9)

% 13.)
gallons = 17
liters = gallons * 3.78

% 14.)
sind (90)
sin (pi/2) 

% 15.)
R1 = 10
R2 = 20
R3 = 30
combineResist = (1 / ((1/ R1)+(1/R2)+(1/R3))  )

% 22.)
%   Uppercase letters come before lowercase.
%   Because the result of following expression is 32 (>0)
'a' - 'A'

% 24.)
'b' >= 'c' - 1      % 1
3 == 2 + 1          % 1
(3 == 2) + 1        % 1
xor (5 < 6, 8 >4)   % 0

% 25.)
x = 1
y = 6
xor (x > 5, y < 10)

% 26.)
3 * 10^5 == 3e5     % Output is logical 1. verified.

% 27.)
log10(10000) == 4   % Output is logical 1. verified.


%% Chapter 2 Exercises

% 1.)
a = 2:7
b = 1.1:0.2:1.7
c = 8:-2:2

% 2.)
vec = linspace (0,2*pi,50)

% 3.)
linspace (2,3,6)

% 4.)
-5:-1
linspace(-5,-1,5)
5:2:9
linspace(5,9,3)
8:-2:4
linspace(8,4,3)

% 6.)
(-1:0.5:1)'

% 7.)


% 8.)
mat = [7:10; 12:-2:6]
mat (1,3)
mat (2,:)
mat (:,1:2)

% 9.)
mat = [1:4; 2:2:8]
[row, col] = size (mat)
ele = numel (mat)
if ( (row*col) == ele )
    disp ('number of elements is the product of the number of rows and columns')
else
    disp ('number of elements is not the product of the number of rows and columns')
end

% 10.)
mat = zeros (2,4)
mat (1,:) = 1:4
mat (:,3) = 10:11

% 12.)
rows = randi ([1,5])
cols = randi ([1,5])
zeros (rows, cols)

% 23.)
a = [3:2:11]
sum (a)

% 26.)
num = [3:2:9]
deno = [1:4]
sum (num ./ deno)

% 30.)
vec = randi ([-10,10],1,5)
vec - 3
max (vec)

% 31.)
a = randi (100, 3, 5)
max (a)
max (a, [], 2)
max (max (a))

%% Chapter 3 Exercises

% 1.)
R = randi ([11,20])         % Outer Radius
r = randi (10)              % Inner Radius

volume = (4/3) * pi * ( (R^3) - (r^3) ) 
% 4.)
[1:10;11:20;21:30]

% 6.)
fprintf ('Value of a is %f \n', 12345.6789)
fprintf ('Value of a is %10.4f \n', 12345.6789)
fprintf ('Value of a is %10.2f \n', 12345.6789)
fprintf ('Value of a is %6.4f \n', 12345.6789)
fprintf ('Value of a is %2.4f \n', 12345.6789)

% 8.)
flowrateMps = input ('Enter the flow in m^3/s:');
fprintf ('A flow rate of %.3f meters per sec is equivalent to %.3f feet per sec \n', flowrateMps, flowrateMps/0.028)

% 13.)
