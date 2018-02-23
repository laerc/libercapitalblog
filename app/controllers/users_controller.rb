class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @articles = Article.all
    @user = User.new
    @user = User.new(user_params)
    @user.save
    redirect_to article_path(@articles)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
