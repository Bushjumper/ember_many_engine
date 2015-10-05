class TasksController < ApplicationController

  def create
    task = Task.new(task_params)

    if task.save
      render json: { id: task.id }, status: 201
    else
      render json: {}, status: 422
    end
  end

  def update
    task = Task.find(params[:task][:id])

    if task.update_attributes(task_params)
      render json: { id: task.id }, status: 200
    else
      render json: {}, status: 422
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :assignee_id)
  end

end

# task_id = params[:task][:id]
# task_attrs = params[:task]

# response = @firebase.get("tasks/#{task_id}")
# existing_task_attrs = response.body

# existing_assignee_id = existing_task_attrs['assignee_id']
# assignee_id = task_attrs['assignee_id']

# if assignee_id != existing_assignee_id
#   @firebase.set("people/#{existing_assignee_id}/assigned_task_ids/#{task_id}", nil)
#   @firebase.set("people/#{assignee_id}/assigned_task_ids/#{task_id}", true)
# end

# stream_ids = task_attrs['stream_ids']
# # task_attrs['stream_ids'] = .map{|id| {id: true}}

# response = @firebase.set("tasks/#{task_id}", task_attrs)

# json = { }
# json[:id] = task_id if response.success?
# respond_to do |format|
#   format.json { render json: json }
# end
