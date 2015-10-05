class Task < ActiveRecord::Base

  after_create :set_firebase

  def fb
    EmberManyEngine::Application.config.firebase
  end

  def set_firebase
    fb.set("tasks/#{id}", {name: name})
  end

end
