# TwO-O-Player Math Game - Planning

## Description
### Create a 2-Player math game where players take turns to answer simple math addition problems. A new math question is generated for each turn by picking two numbers between 1 and 20. The player whose turn it is is prompted the question and must answer correctly or lose a life.

## Details
### Both players start with 3 lives. They lose a life if they mis-answer a question. At the end of every turn, the game should output the new scores for both players, so players know where they stand.

### The game doesn’t end until one of the players loses all their lives. At this point, the game should announce who won and what the other player’s score is.


# Tasks
## Task 1: Extract Nouns for Classes
### Below could be the key nouns:

1. **Game**: It will represents the overall game, manage the flow of the game and keep track of turns.

2. **Player**: It will represent a player in the game. It will track information about player's number of lives.

3. **Question**: It will represent the math question, It will hold the logic for generating and evaluating the math problem (e.g., two random numbers and their sum).

4. **Turn**: It will represents a turn in the game, track which player is currently answering the question and manage the sequence of play.


## Task 2: Write their roles
### Roles for Each Class

1. **Game**:
   - **Role**: The `Game` class will manage the overall flow of the game. It will initialize the players, manage the game loop, and keep track of the current player. This class will be responsible for starting the game, prompting players with questions, evaluating answers, and determining when the game ends. It will also handles user input and output.

   - **State**:
     - `players`: A list of `Player` objects.
     - `currentPlayerIndex`: An integer tracking the index of the current player in the players list.
     - `isGameOver`: A boolean indicating whether the game has ended.

   - **Behavior**:
     - `__init__(self, player1_name, player2_name)`: Initialize the game with two players.
     - `start(self)`: Start the game loop, alternating turns between players until the game ends.
     - `switch_turns(self)`: Switch the current player after each turn.
     - `check_game_over(self)`: Determine if the game is over by checking the players' lives.
     - `declare_winner(self)`: Declare the winner or end the game in a draw.

   - **User I/O**: This class will handle all user input and output, prompting players and displaying results.

2. **Player**:
   - **Role**: The `Player` class will represent an individual player in the game. It will store the player's name and the number of lives they have remaining. The class will be responsible for managing the player's state, including reducing lives when a question is answered incorrectly and tracking whether the player is still active in the game.

   - **State**:
     - `name`: A string representing the player's name.
     - `lives`: An integer representing the number of lives the player has.

   - **Behavior**:
     - `__init__(self, name)`: Initialize the player with a name and a default number of lives.
     - `lose_life(self)`: Reduce the player's lives by one.
     - `is_alive(self)`: Return a boolean indicating whether the player still has lives remaining.

   - **User I/O**: This class will not handle user I/O directly.

3. **Question**:
   - **Role**: The `Question` class will generate and represent a math problem that a player must solve. It will include the logic for creating random addition problems, check the correctness of the player's answer, and provide the correct answer.

   - **State**:
     - `number1`: An integer representing the first random number in the math problem.
     - `number2`: An integer representing the second random number in the math problem.
     - `correct_answer`: An integer representing the sum of `number1` and `number2`.

   - **Behavior**:
     - `__init__(self)`: Initialize the question by generating two random numbers and calculate the correct answer.
     - `ask_question(self)`: Return a string with the math problem for the player to answer.
     - `check_answer(self, player_answer)`: Compare the player's answer to the correct answer and return a boolean indicating whether it is correct.

   - **User I/O**: This class might indirectly influence user I/O by providing the question to be displayed, but it won't handle I/O directly.

4. **Turn**:
   - **Role**: The `Turn` class will manage the sequence of play, determine whose turn it is and ensure that each player will get an opportunity to answer a question. It will keep track of the current player and ensure that the game will alternate between each player's turn correctly.

   - **State**:
     - `current_player`: A reference to the `Player` object representing the player whose turn it is.

   - **Behavior**:
     - `__init__(self, player)`: Initialize the turn with the current player.
     - `end_turn(self)`: End the current player's turn and return control to the `Game` class to switch players.

   - **User I/O**: This class will not handle user I/O directly.