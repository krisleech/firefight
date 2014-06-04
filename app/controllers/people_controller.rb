class PeopleController < ApplicationController
  respond_to :json

  def index
    render :json => PeopleSerializer.to_json(PeopleRepo.all)
  end

  def create
    person = Person.new(person_params)
    if person.valid?
      PeopleRepo.commit(person)
      render :json => PersonSerializer.to_json(person)
    else
      render :json => PersonSerializer.to_json(person) # needs error code
    end
  end

  private

  def person_params
    params[:person] # TODO: has js style keys!
  end
end

class PeopleSerializer
  def self.to_json(people)
    Jbuilder.encode do |json|
      json.array! people do |person|
        json.full_name person.full_name
      end
    end
  end
end

class PersonSerializer
  def self.to_json(person)
    Jbuilder.encode do |json|
      json.full_name person.full_name
    end
  end
end
