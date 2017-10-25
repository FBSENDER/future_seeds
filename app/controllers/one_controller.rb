require 'one'
class OneController < ApplicationController
  def upload_groups
    qq_number = params[:qq_number].to_i
    groups = params[:groups].split(',').map{|g| g.to_i}
    worker = Worker.where(qq_number: qq_number).take
    if worker.nil?
      worker = Worker.new
      worker.qq_number = qq_number
      worker.save
    end

    gs = Group.where(qq_nubmer: qq_number).pluck(:group_number)
    tasks = Task.where(status: 1).to_a
    groups.each do |group|
      next if gs.include(group)
      g = Group.new
      g.qq_number = qq_number
      g.group_number = group
      g.save
      tasks.each do |t|
        td = TaskDetail.new
        td.task_id = t.id
        td.qq_number = qq_number
        td.group_number = group
        td.message = t.message
        td.status = 0
        td.save
      end
    end
    gss = gs - groups
    Group.where(qq_number: qq_number, group_number: gss).each do |g|
      next if g.status == -1
      g.status = -1
      g.save
    end
    render json: {status: 1} 
  end

  def get_tasks
    tasks = TaskDetail.where(qq_nubmer: params[:qq_number].to_i, status: 0)
    render json: {status: 1, tasks: tasks}
  end

  def finish
    t = TaskDetail.where(id: params[:id]).take
    unless t.nil?
      t.status = 1
      t.sent_at = Time.now
      t.save
    end
    render json: {status: 1}
  end

end
