class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def edit
    @my = current_user
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to user_path(@my)
    end
  end

  def update
    @user = User.find(params[:id])
  if
    @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  else
    @users = User.all
    render 'edit'
  end

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
