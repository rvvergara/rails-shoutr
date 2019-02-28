class ShoutsController < ApplicationController
  def create
    
    @shout = current_user.shouts.new(shout_params)

    if !@shout.save
      flash[:danger] = "Invalid shout"
    else
      flash[:success] = "Shout successful!"
    end
    redirect_to root_path
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end
end
