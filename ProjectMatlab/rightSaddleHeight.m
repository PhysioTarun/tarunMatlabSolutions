%% This is a Project to measure the saddle hight appropritate for a user 
%   depending upon the user's crouch height and leg length.
%
%       Crouch height is measured by placing a thick book between your legs
%   as high as posible and measuring the distance from top of the book to 
%   the floor in straight vertical line.
%
%       Leg length is measured as the vertical distance from lowest part of
%   thigh at knee to floor when sitting with horizontal thigh and foot 
%   flat on floor.
%
%       Optimum knee angle is set at 115 degrees, which can be altered if
%   required. If a user has restriction in fully extending the knee(due to
%   injury or disease), then that range can be used as optimum knee angle
%   to do the calculations, and the output will not extend knee range of
%   motion beyond that.
%
%   Please use valid inputs as this program is not made to check validity
%   of inputs for keeping it simple.
 
%% For the purpose of simplification of upcoming mathematical expressions,
%   following variables are used as abbreviations:
%       SC is Saddle to Crank length
%       r is radius of foot peg
%       TL is Thigh Length
%       LL is Leg Length
%       alpha is angle of foot peg to saddle at crank
%       theta is angle at knee
%       beta is angle that saddle-crank axis makes with ground

home()


%% Input Static Cycle Data

fprintf('Welcome to Saddle Height Finder!\n')
fprintf("We have the following cycles available;\n")
fprintf(" 1. Small \n 2. Medium \n 3. Large \n 4. Your Specifications \n")

cycleChoice = input('Enter your choice: ');
%   cycleChoice selects data from statCycleInputData.xlsx if choice 1, 2 or
%   3 is entered. Otherwise a user input data for cycle is used.

if cycleChoice >= 1 && cycleChoice <=3
    cycleData = xlsread('statCycleInputData.xlsx',1,'A2:E4');
    minCrank2SaddleLength = cycleData(cycleChoice,2);
    maxCrank2SaddleLength = cycleData(cycleChoice,3);
    crank2floorDistance = cycleData(cycleChoice,4);
    r = cycleData(cycleChoice,5);        % r is radius of foot peg
else
    minCrank2SaddleLength = input('Enter Minimum Crank to Saddle Length:');
    maxCrank2SaddleLength = input('Enter Maximum Crank to Saddle Length:');
    crank2floorDistance = input('Enter Crank to Floor Distance:');
    r = input('Enter Radius of Foot Peg:');% r is radius of foot peg
end

%% Input User Data
%   The program asks the user whether to use data from excel sheet or that
%   provided by the user.
userChoice = input('Do you want to use your user values? (y/n): ','s');

if userChoice == 'n'
    userData = xlsread('statCycleInputData.xlsx',2,'C2:D11');
    randInteger = randi(10);
    crouchHeight = userData(randInteger,1);
    LL = userData(randInteger,2);
        % Loads data from excel sheet
else
    crouchHeight = input('Enter the Crouch Height: ');
    LL = input('Enter the Leg length: ');
        % Uses user provided data
end

%   Calcutating Thigh segment length:
TL = crouchHeight - LL;

%% Calculating Max Saddle Height for User
maxSaddleHeight = crouchHeight - r; 

%% Calculating Minimum Saddle Heigth for User
%   Minimum Saddle Heigth is defined as length from saddle to crank when 
%   foot peg is at highest level (on saddle-crank axis) with the thigh
%   horizontal.

beta = 80;         % beta is angle that saddle-crank axis makes with ground
saddle2Peg = (TL * cosd(beta)) + sqrt(  LL^2 - (TL * sind(beta))^2  );
%   saddle2Peg is Saddle to Foot Peg length (foot peg is at highest level)
%   TL is Thigh Length
%   LL is Leg Length

minSaddleHeight = saddle2Peg + r;
%   r is radius of foot peg

%% Calculating Optimum Saddle Height for User
%   Optimum Saddle Height depends on the angle (theta) at knee when the
%   foot is on the lowermost position of the foot peg (on saddle-crank
%   axis)

theta = input('Pleae Enter Optimum Knee Angle as 115 degrees (Default) or Your value:  ');
optSaddleHeight = saddleHeight(TL,LL,r,theta);
% optSaddleHeight (optimum saddle height) is the saddle height when knee is
% at optimum angle and foot peg on lowermost point on saddle-crank axis.

%% Calculating Knee ROM when Saddle is at Optimum Saddle Height

alphaMatrix = 0:359;            % Matrix of angles between Saddle and Foot peg at Crank
thetaMatrix = zeros(1,360);     % Matrix of angles at knee corresponding to alphaMatrix

for i = 1:360
    thetaMatrix(i) = kneeAngle(optSaddleHeight,r,TL,LL,alphaMatrix(i));
end
plot (alphaMatrix,thetaMatrix);     % Plotting data
title('Knee Angle Range of Motion');
xlabel('Position of Foot Peg (degrees)');
ylabel('Knee Angle (degrees)');

minKneeRange = thetaMatrix(1);      % Minimum range at knee during whole cycle i.e. alpha = 0 degree
maxKneeRange = thetaMatrix(181);    % Maximum range at knee during whole cycle i.e. alpha = 180 degrees

%% OUTPUT

fprintf('\n\n============== OUTPUT ========================\n')

% Optimum Saddle Height

if optSaddleHeight > maxCrank2SaddleLength
    fprintf('This cycle is smaller in size than required. Consider using a larger size cycle \n')
elseif optSaddleHeight < minCrank2SaddleLength
    fprintf('This cycle is larger in size than required. Consider using a smaller size cycle \n')    
end

fprintf('The Optimum Saddle Height for this user is : %4.2f cm \n',optSaddleHeight)
fprintf('The Knee Range of Motion during cycling will be from %4.2f to %4.2f degrees \n\n',thetaMatrix(1),thetaMatrix(181))

% Knee Range of motion if saddle set at maximum heigth for the user:
fprintf('The Maximum Saddle Height for the user will be: %4.2f cm ',maxSaddleHeight)
min = kneeAngle(maxSaddleHeight,r,TL,LL,0);
max = kneeAngle(maxSaddleHeight,r,TL,LL,180);
fprintf('and the knee range will be from %4.2f to %4.2f degrees. \n\n',min,max);

% Knee Range of motion if saddle set at minimum heigth for the user:
fprintf('The Minimum Saddle Height for the user will be: %4.2f cm ',minSaddleHeight)
min = kneeAngle(minSaddleHeight,r,TL,LL,0);
max = kneeAngle(minSaddleHeight,r,TL,LL,180);
fprintf('and the knee range will be from %4.2f to %4.2f degrees.',min,max);
