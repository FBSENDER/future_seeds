require 'qq'
class TaskController < ApplicationController
  def home
    render plain: 'hello world'
  end
  def task
    @tasks = Task.where(qq_number: params[:qq_number].to_i)
    render json: {status: 1, tasks: @tasks}
  end

  def finish
    @task = Task.where(id: params[:id].to_i).take
    if @task.nil?
      render json: {status: 1}
      return
    end
    @task.sent_time = Time.now
    @task.status = 1
    @task.save
    render json: {status: 1}
  end
end
