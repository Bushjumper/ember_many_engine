class Person < ActiveRecord::Base

  has_many :assigned_tasks, class_name: 'Task', inverse_of: :assignee

  after_create :set_firebase

  def fb
    EmberManyEngine::Application.config.firebase
  end

  def fb_ref
    "people/#{id}"
  end

  def fb_json
    {name: name}
  end

  def set_firebase
    fb.set(fb_ref, fb_json)
  end
end
