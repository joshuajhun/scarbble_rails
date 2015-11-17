class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.new(play_params)
    if @play.save unless @play.word == ''
      redirect_to plays_path
    else
      flash[:errors] = "blank"
      redirect_to new_play_path
    end
  end

  def edit
  end


private
  def play_params
    params.require(:play).permit(:word)
  end
end
