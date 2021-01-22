require 'pry'
class TicTacToe
    attr_accessor :board 
    # attr_reader :index 

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = Array.new(9, " ")
    end 

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]}  "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]}  "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]}  "
    end 

    def input_to_index(input)
        (input.to_i - 1)
    end 

    def move(index, token = "X")
        self.board[index] = token 
    end  
    
    def position_taken?(index)
        self.board[index].include?("X") || self.board[index].include?("O") ? true : false
    end 

    def valid_move?(index)
        if !position_taken?(index) && index.between?(0, 8)
            true 
        elsif !index.between?(0, 8)
            false   
        end
    end 

    def turn_count 
        self.board.count("X") + self.board.count("O") 
    end  

    def current_player 
        self.turn_count % 2 == 0 ? "X" : "O"
    end 

    def turn
        puts "Please make a move: 1-9"
        index = input_to_index(gets.chomp) 
        if self.valid_move?(index)
            self.move(index, self.current_player)
            self.display_board 
        else 
            turn 
        end 
    end 
        
    def won? 
        WIN_COMBINATIONS.each do |i|
            if (self.board[i[0]] == "X" && self.board[i[1]] == "X" && self.board[i[2]] == "X") ||
                (self.board[i[0]] == "O" && self.board[i[1]] == "O" && self.board[i[2]] == "O")
                return i
            end 
        end 
        false 
    end 

    def full? 
        if self.board.none?(" ")
            true 
        else 
            false 
        end 
    end 

    def draw?
        if self.full? && !self.won?
            true 
        elsif self.won?
            false 
        else 
            false 
        end 
    end 

    def over?
        if self.full? || self.won? 
            true 
        else
            false 
        end 
    end 

    def winner 
        if self.won?
            self.board[self.won?[0]]
        else 
            nil  
        end 
    end 

    def play 
        while !self.over? 
            self.turn 
            if self.draw?
                break 
            end 
        end  
        if self.won? 
            puts "Congratulations #{self.winner}!"
        else 
            puts "Cat's Game!"
        end
    end 
end 