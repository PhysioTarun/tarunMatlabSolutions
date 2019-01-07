function [theta] = kneeAngle(SC,r,TL,LL,alpha)
%kneeAngle calculates the angle at knee corresponding to the angle of 
% saddle to foot peg at crank. 
%   
%   This function requires five inputs as follows:
%       SC is Saddle to Crank length
%       r is radius of foot peg
%       TL is Thigh Length
%       LL is Leg Length
%       alpha is agle of foot peg to saddle at crank
%
%   And gives output as theta which is angle at knee

cosTheta = (TL^2 + LL^2 - SC^2 - r^2 + (2 * SC * r * cosd(alpha)) ) / (2 * TL * LL) ;
theta = acosd(cosTheta);

end

