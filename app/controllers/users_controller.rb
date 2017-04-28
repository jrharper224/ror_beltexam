class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])

  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to '/ideas'
    else
      flash[:registration_errors] = user.errors.full_messages
      redirect_to '/'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end
end
