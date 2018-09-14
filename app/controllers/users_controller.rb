class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(strong_params)

    if @user.save
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def strong_params
    params.require(:user).permit(:email, :password)
  end
end
