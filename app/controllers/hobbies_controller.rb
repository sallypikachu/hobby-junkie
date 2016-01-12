class HobbiesController < ApplicationController
  before_action :correct_user,   only: [:index, :show]
  before_action :logged_in_user, only: [:index, :show]

  def index
    @user = User.find_by(id: session[:user_id])
    @hobbies = Hobby.where(user_id: session[:user_id])
  end

  def show
    @hobby = Hobby.find(params[:id])
    @tasks = @hobby.tasks
  end

  def new
    @hobby = Hobby.new
  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.user_id = session[:user_id]
    if @hobby.save
      flash.notice = "Hobby added successfully"
      redirect_to hobbies_path
    else
      flash.notice = @hobby.errors.full_messages.join(". ")
      render "new"
    end
  end

  private
  def hobby_params
    params.require(:hobby).permit(
    :name,
    :description
    )
  end


  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to root_url
    end
  end

  def correct_user
    @user = User.find_by(id: session[:user_id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
