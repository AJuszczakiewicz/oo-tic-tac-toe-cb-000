class TicTacToe
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
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "  
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
    
  def move(position, character)
    @board[position] = character
  end
    
  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end
    
  def valid_move?(position)
      position.between?(0,8) && !position_taken?(position)
    end
    
  def turn_count
    @board.count("X") + @board.count("O")
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
    
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      character = current_player
      move(index, character)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combination|
      tiles_to_check = @board.values_at(*combination)
      if tiles_to_check.all?{ |obj| obj == "X"}  || tiles_to_check.all?{ |obj| obj == "O"}
        return combination
      end
    end
    return nil
  end
  
  def full?
    @board.all? { |obj| obj == "X" || obj == "O" }
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || full?
  end
  
  def winner
    result = won?
    if result
      @board.values_at(*result)[0]
    else nil
    end
  end
    
  def play
    until over?
      turn
      if draw?
        break
      end
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
  
end