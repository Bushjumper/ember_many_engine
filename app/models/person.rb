class Person < ActiveRecord::Base

  after_create :set_firebase

  def set_firebase
    @firebase = Firebase::Client.new("https://" + 'ember-many-three' + ".firebaseio.com")
    @firebase.set("people/#{id}", {name: name})
  end
end
