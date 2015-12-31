class TasksController < ApplicationController
  def show
    @hobby = Hobby.find(params[:hobby_id])
    @task = Task.find(params[:id])
  end

  def new
    @hobby = Hobby.find(params[:hobby_id])
    @task = Task.new
  end

  def create
    @hobby = Hobby.find(params[:hobby_id])
    @task = Task.new(task_params)
    @task.hobby = @hobby
    if @task.save
      flash.notice = "Task added successfully"
      redirect_to hobby_path(@hobby)
    else
      flash.notice = @task.errors.full_messages.join(". ")
      render "new"
    end
  end

  private
  def task_params
    params.require(:task).permit(
    :task_name,
    :description,
    :link,
    :complete
    )
  end
end
