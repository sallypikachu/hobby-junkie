class HobbiesController < ApplicationController
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
end
