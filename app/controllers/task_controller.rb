require 'qq'
class TaskController < ApplicationController
  def home
    render plain: 'hello world'
  end

  def target_groups
    group_numbers = WorkerGroup.where(qq_number: params[:qq_number].to_i).pluck(:group_number)
    render json: {status: 1, group_numbers: group_numbers}
  end

  def update_target_groups
    group_numbers = params[:group_numbers].split(',')
    wgs = WorkerGroup.where(qq_number: params[:qq_number].to_i)
    wgs.each do |wg|
      if group_numbers.include?(wg.group_number.to_s)
        wg.status = 1
      else
        wg.status = wg.status == 1 ? -1 : 0
      end
      wg.save
    end
    render json: {status: 1}
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
    @task.sent_at = Time.now
    @task.status = 1
    @task.save
    render json: {status: 1}
  end
end
