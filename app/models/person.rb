class Person < ActiveRecord::Base

  has_many :assigned_tasks, class_name: 'Task', inverse_of: :assignee

  after_create  :fb_create
  around_update :fb_update



  def fb
    EmberManyEngine::Application.config.firebase
  end

  def fb_ref
    "people/#{id}"
  end

  def fb_json
    { name: name }
  end

  def fb_create
    fb.set(fb_ref, fb_json)
  end



  def fb_update
    stash = changed
    yield  # this makes the save happen

  end


  # def fb_update
  #   fb.update(fb_ref, fb_json)
  # end

end
