class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def index
    @profileable = find_profileable
    @users = @profileable.users
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def find_profileable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
end
