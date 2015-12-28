class HobbiesController < ApplicationController
  def index
    @hobbies = Hobby.all
    @user = User.find_by(id: session[:user_id])
  end

  def show
    @hobby = Hobby.find(params[:id])
  end

  def new
    @hobby = Hobby.new
  end
end
