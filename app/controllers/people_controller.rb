class PeopleController < ApplicationController
  def create

    person = Person.new(person_params)

    if person.save
      render json: { id: person.id }, status: 201
    else
      render json: {}, status: 422
    end
  end

  private

  def person_params
    params.require(:person).permit(:name)
  end

end
