Feature: TicTacToeGameEngine
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers

Scenario: When the board is empty then there is no winner yet
	Given I have a tic tac toe board
	And the board is empty
	When I determine who the winner is
	Then there should be no winner

Scenario: When the top is all X then X is the winner
	Given I have a tic tac toe board
	And the top row is a "X"
	When I determine who the winner is
	Then the winner is "X"

Scenario: When the top is all O then O is the winner
	Given I have a tic tac toe board
	And the top row is a "O"
	When I determine who the winner is
	Then the winner is "O"

Scenario: When the board has data figure out a winner
	Given I have a tic tac toe board
	And the table looks like this
	| Col1 | Col2 | Col3 |
	| X    |      | O    |
	| O    | X    | O    |
	| O    |      | X    |
	When I determine who the winner is
	Then the winner is "X"