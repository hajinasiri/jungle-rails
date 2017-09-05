class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create

    if (User.where(email: user_params[:email])) == []
      byebug
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to jungle! You are one of us now!!"
        log_in(@user)
        redirect_to @user
        # Handle a successful save.
      else

        render 'new'
      end
    else
      flash[:error] = "Error"
      redirect_to "/users/new"
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password , :password_confirmation)
    end
end


