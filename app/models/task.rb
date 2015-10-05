class Task < ActiveRecord::Base

  belongs_to :assignee, class_name: 'Person', inverse_of: :assigned_tasks

  after_create :fb_create
  after_update :fb_update

  def fb
    EmberManyEngine::Application.config.firebase
  end

  def fb_ref
    "tasks/#{id}"
  end

  def fb_json
    {
      name: name,
      assignee_id: assignee.try(:id)
    }
  end

  def fb_create
    fb.set(fb_ref, fb_json)
    if assignee_id.present?
      fb.set("people/#{assignee_id}/assigned_task_ids/#{id}", true)
    end
  end

  def fb_update
    fb.set(fb_ref, fb_json)
    if assignee_id_changed?
      fb.delete("people/#{previous_assignee_id}/assigned_task_ids/#{id}")
      fb.set("people/#{assignee_id}/assigned_task_ids/#{id}", true)
    end
  end

  def previous_assignee_id
    changes['assignee_id'][0]
  end


end
