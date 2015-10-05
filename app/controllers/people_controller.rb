class PeopleController < ApplicationController
  def create

    response = @firebase.set("people/#{params[:person][:id]}", params[:person])

    json = { }
    json[:id] = params[:person][:id] if response.success?
    respond_to do |format|
      format.json { render json: json }
    end
  end

end
