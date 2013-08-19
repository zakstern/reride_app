class UsersController < ApplicationController
  def new
    @profile = find_profile
  	@user = @profile.users.new
  end

  def create
    @profile = find_profile
    @user = @profile.users.new(user_params)
    if @user.save
      redirect_to @profile, notice: "User created."
    else
      render :new
    end
  end

  def index
    @profile = find_profile
    @users = @profile.users
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def find_profile
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
end
