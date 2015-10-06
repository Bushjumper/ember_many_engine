class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_filter :initialize_firebase
  before_filter :set_access_control_headers

  private

  def initialize_firebase
    @firebase = Firebase::Client.new("https://ember-many-two.firebaseio.com")
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = 'POST, GET, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = 'x-requested-with,Content-Type, Authorization'
  end

end
