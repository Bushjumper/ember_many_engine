class TasksController < ApplicationController
  def create

    task_id = params[:task][:id]
    task_attrs = params[:task]

    response = @firebase.get("tasks/#{task_id}")
    existing_task_attrs = response.body

    existing_assignee_id = existing_task_attrs['assignee_id']
    assignee_id = task_attrs['assignee_id']

    if assignee_id != existing_assignee_id
      @firebase.set("people/#{existing_assignee_id}/assigned_task_ids/#{task_id}", nil)
      @firebase.set("people/#{assignee_id}/assigned_task_ids/#{task_id}", true)
    end

    # task_attrs['stream_ids'] = task_attrs['stream_ids'].map{|id| {id: true}}

    response = @firebase.set("tasks/#{task_id}", task_attrs)

    json = { }
    json[:id] = task_id if response.success?
    respond_to do |format|
      format.json { render json: json }
    end
  end

end
