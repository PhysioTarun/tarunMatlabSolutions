

% Assume 1 as Cross, 8 as Zero, 0 as blank

gameBoard = [0 0 0; 
             0 0 0;
             0 0 0];
continuePlay = 'y'
         
while (continuePlay == y)

userInputRow = input ('Enter which ROW you want to put your mark (1): ');
userInputCol = input ('Enter which COLUMN you want to put your mark (1): ');

gameBoard(userInputRow, userInputCol) = 1;

disp(gameBoard)


playMore = input('want to play more?(y/n):')
if playMore ~= 'y' || playMore ~= 'n'
    printf('Invalid input! Please type y or n')
end

end

