class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.new(play_params)
    if @play.save
      redirect_to plays_path
    else
      flash.now[:errors] = "blank"
      render :new
    end
  end

  def edit
  end

  def destroy
    @play = Play.delete(params[:id])
    redirect_to plays_path
  end


private
  def play_params
    params.require(:play).permit(:word)
  end
end
