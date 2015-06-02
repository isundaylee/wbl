class PagesController < ApplicationController
  def homepage
    @nav_path = "/"

    @exec_board = Member.exec.to_a

    # Center the last one in case of 3n+1
    if @exec_board.size % 3 == 1
      @exec_board = @exec_board[0...-1] + [nil, @exec_board[-1], nil]
    end
  end

  def leadership
    @nav_path = "/leadership"

    @exec_board = Member.exec.to_a
    @general_board = Member.all.to_a # For now

    # Center the last one in case of 3n+1
    if @exec_board.size % 3 == 1
      @exec_board = @exec_board[0...-1] + [nil, @exec_board[-1], nil]
    end

    if @general_board.size % 3 == 1
      @general_board = @general_board[0...-1] + [nil, @general_board[-1], nil]
    end
  end

  def posts
    @name = params[:name].gsub('-', '_')
    @nav_path = "/posts/#{params[:name]}"

    post = Post.find_by(name: @name)

    if post
      @content = post.display_html
    else
      @content = [
        '<div class="subtitle"><h2>Oops</h2></div>',
        '<div class="container post-container"><p>You need to create a post with name "' + @name + '". </p></div>'
      ].join.html_safe
    end
  end
end
