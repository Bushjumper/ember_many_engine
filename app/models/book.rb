class Book < ActiveRecord::Base

  after_create :set_firebase

  def fb
    EmberManyEngine::Application.config.firebase
  end

  def fb_ref
    "books/#{id}"
  end

  def fb_json
    {name: name}
  end

  def set_firebase
    fb.set(fb_ref, fb_json)
  end
end
