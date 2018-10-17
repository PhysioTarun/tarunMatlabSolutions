% Assignment 3: Tic Tac Toe
%
% Submitted by: tarun k singh
%
% Due: October 15, 2018
%
% This is a programme to play a game of Tic Tac Toe with Computer. The 
% Gameboard is a matrix of 3x3 zeroes. Player moves first and marks his move 
% by 1. Computer marks its move by '4'. Player selects his move by entering
% a digit from 1 to 9.

clear all
disp ('Welcome to the Game of Tic Tac Toe')

while 1
    playmore = input ('Want to play a game? (y/n):', 's');
    if playmore ~= 'y' && playmore ~= 'n'
        disp ('Wrong Input!')
    else
        break
    end
end

while playmore == 'y'   % Outermost Loop for Playing more games

board = zeros(1,9);     % Board is made of 9 zeros

disp(board (1,[1:3]))   % to display Board in 3x3 matrix
disp(board (1,[4:6]))
disp(board (1,[7:9]))

         
for j = 1:2                         % Loop for first 4 moves

    while 1                         % Player's 1st & 3rd move
        
        rc = input ('Enter Your Position (1-9)');
        if board (rc) == 1 || board (rc) == 4
            disp ('Wrong Input') 
        else
            break;
        end
    end
    board (rc) = 1;
    
    disp(board (1,[1:3]))
    disp(board (1,[4:6]))
    disp(board (1,[7:9]))
        
    while 1                            % Computer's 2nd and 4th move
        computerMove = randi ([1,9]);
        if board (computerMove) ~= 1 && board (computerMove) ~= 4
            break;
        end
    end

    board(computerMove) = 4;

    disp(board (1,[1:3]))
    disp(board (1,[4:6]))
    disp(board (1,[7:9]))
    
end

move = 0;
result = zeros (1,8);
gameEnd = 0;

for j = 1:3                 % Loop for 5th to 9th moves
    
    while 1                 % Player's move 5th onwards
        
        rc = input ('Enter Your Position (1-9)');
        if board (rc) == 1 || board (rc) == 4
            disp ('Wrong Input') 
        else
            break;
        end
    end
    board (rc) = 1;
    
    disp(board (1,[1:3]))
    disp(board (1,[4:6]))
    disp(board (1,[7:9]))
    move = move +1;
    
    
    % Check Winning Condition
    result (1) = board (1) + board (2) + board (3);
    result (2) = board (4) + board (5) + board (6);
    result (3) = board (7) + board (8) + board (9);
    result (4) = board (1) + board (4) + board (7);
    result (5) = board (2) + board (5) + board (8);
    result (6) = board (3) + board (6) + board (9);
    result (7) = board (1) + board (5) + board (9);
    result (8) = board (7) + board (5) + board (3);
    
    for j = 1:8                 % Loop for Checking Player's win condition
        if result (j) == 3      % Win condition for player is sum=3
            disp ('You Win!')
            gameEnd = 1;
            break
        end
    end
    
    if gameEnd == 1               % Check if Player already won
        break
    elseif move == 5              % Check for all move completed
        disp ('Game Over!')
        break
    end
    
    
    while 1                         % Computer's move 5th onwards
        computerMove = randi ([1,9]);
        if board (computerMove) ~= 1 && board (computerMove) ~= 4
            break;
        end
    end

    board(computerMove) = 4;

    disp(board (1,[1:3]))
    disp(board (1,[4:6]))
    disp(board (1,[7:9]))
    move = move +1;
    
    % Check Winning Condition for computer
    result (1) = board (1) + board (2) + board (3);
    result (2) = board (4) + board (5) + board (6);
    result (3) = board (7) + board (8) + board (9);
    result (4) = board (1) + board (4) + board (7);
    result (5) = board (2) + board (5) + board (8);
    result (6) = board (3) + board (6) + board (9);
    result (7) = board (1) + board (5) + board (9);
    result (8) = board (7) + board (5) + board (3);
    
    for j = 1:8                 % Loop for Checking Computer's win condition
        if result (j) == 12     % Win condition for computer is sum=12
            disp ('Computer Wins!')
            gameEnd = 1;
            break
        end
    end
    
    if gameEnd == 1             % Break out of game if computer already won
        break
    end
    
end

while 1                         % Prompt player for another game
    playmore = input ('Want to play more? (y/n):', 's');
    if playmore ~= 'y' && playmore ~= 'n'
        disp ('Wrong Input!')
    else
        break
    end
end
    
    if playmore == 'n'          % End Game
        disp ('Bye Bye!')
        break
    end
end

