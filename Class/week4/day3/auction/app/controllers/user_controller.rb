class UserController < ApplicationController
  def show
    @users = User.all
    render 'show'
  end
  def create
    @my_user = User.new(
    name: params[:user][:name],
    email: params[:user][:email]
    )
    @my_user.save
    redirect_to '/users'
  end
  def destroy

  end
  def new
    @my_user = User.new
    render 'new'
  end
end
