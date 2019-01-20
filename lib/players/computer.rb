require 'pry'
class Players::Computer < Player
  WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]
      ]
  def move(board)
    puts "Computer's move:"
    case board.turn_count
    when 0
      "5"
    when 1
      if board.taken?("5") == true
        choices = [1,3,5,7,9].shuffle
        position = choices.detect{|option| board.taken?(option.to_s) == false}
        "#{position}"
      else
        "5"
      end
    when 2,3,4,5,6,7,8
      if win_move(board) != nil
        win_move(board)
      elsif block_move(board) != nil
        block_move(board)
      elsif two_in_a_row(board) != nil
        two_in_a_row(board)
      else
        x = [1,2,3,4,5,6,7,8,9].shuffle
        position = x.detect{|position| board.taken?(position.to_s) == false}
        "#{position}"
      end
    when 9
      x = [1,2,3,4,5,6,7,8,9]
      position = x.detect{|position| board.taken?(position.to_s) == false}
      "#{position}"
    else
    end
  end
end 
