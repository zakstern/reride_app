class UsersController < ApplicationController
  before_filter :load_profile

  def index
    @users = @profile.users
  end

  def new
  	@user = @profile.users.new
  end

  def create
    @user = @profile.users.new(user_params)
    if @user.save
      redirect_to @profile, notice: "User created."
    else
      render :new
    end
  end

  def show
    @user = @profile.users.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, 
        :email, :password, :password_confirmation, :profile)
    end

    def load_profile
      resource, id = request.path.split('/')[1, 2]
      @profile = resource.singularize.classify.constantize.find(id)
    end

  # alternative option:
  # def load_commentable
  #   klass = [Article, Photo, Event].detect { |c| params["#{c.name.underscore}_id"] }
  #   @commentable = klass.find(params["#{klass.name.underscore}_id"])
  # end
end
