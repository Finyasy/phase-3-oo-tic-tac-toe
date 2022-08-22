class TicTacToe
    # TicTacToe#initialize assigns an instance variable @board to an array with 9 blank spaces " "
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    # WIN_COMBINATIONS defines a constant WIN_COMBINATIONS with arrays for each win combination
    WIN_COMBINATIONS =[
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    #display_board prints arbitrary arrangements of the board
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    # input_to_index accepts the user's input (a string) as an argument
    def input_to_index(user_input)
        user_input.to_i - 1
    end

    # move allows "X" player in the top left and "O" in the middle
    def move(index, current_player)
        @board[index] = current_player
    end
    # position_taken? returns true/false based on whether the position on the board is already occupied
    def position_taken?(index)
        @board[index] != " " && @board[index] != ""
    end
    # valid_move? returns true/false based on whether the position is already occupied
    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end
    # turn_count counts occupied positions
    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end
    # current_player returns the correct player, X, for the third move
    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    # turn receives user input via the gets method
    def turn
        puts "Please enter 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
        #won? returns false for a draw
        def won?
            WIN_COMBINATIONS.detect do |win_combination|
                win_combination.all? {|index| @board[index] == "X"} || win_combination.all? {|index| @board[index] == "O"}
            end
        end
        # full? returns true for a draw
        def full?
            @board.all?{|token| token == "X" || token == "O"}
        end
        # draw? returns true for a draw
        def draw?
            !won? && full?
        end
        # over? returns true for a draw or win
        def over?
            won? || draw?
        end
        # winner returns the winner X or O
        def winner
            if winning_combo = won?
                @board[winning_combo.first]
            end
        end
        # play method starts the game
        def play
            until over?
                turn
            end
            if won?
                puts "Congratulations #{winner}!"
            elsif draw?
                puts "Cat's Game!"
            end
        end
    end
end