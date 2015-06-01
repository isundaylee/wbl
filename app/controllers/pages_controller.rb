class PagesController < ApplicationController
  def homepage
    @exec_board = Member.exec.to_a

    # Center the last one in case of 3n+1
    if @exec_board.size % 3 == 1
      @exec_board = @exec_board[0...-1] + [nil, @exec_board[-1], nil]
    end
  end
end
