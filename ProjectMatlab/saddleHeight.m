function [SC] = saddleHeight(TL,LL,r,theta)
%saddleHeight gives saddle height (i.e. saddle to crank distance) at input
%   variables when foot peg is at lowermost position i.e. alpha = 180 degree
%
%   SC is Saddle to Crank length
%   r is radius of foot peg
%   TL is Thigh Length
%   LL is Leg Length
%   alpha is agle of foot peg to saddle at crank
%   theta is angle at knee

SC = sqrt(TL^2 + LL^2 - (2 * TL * LL * cosd(theta) )) - r;

end

