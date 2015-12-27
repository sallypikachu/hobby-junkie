class HobbiesController < ApplicationController
  def index
    @hobbies = Hobby.all
    @user = User.find_by(id: session[:user_id])
    binding.pry
  end

  def show
    @hobby = Hobby.find(params[:id])
  end
end
