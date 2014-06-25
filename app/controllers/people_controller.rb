class PeopleController < ApplicationController
  respond_to :json
  wrap_parameters format: :json

  def index
    logger.debug("PEOPLE: #{PeopleRepo.all}")
    render :json => PeopleSerializer.to_json(PeopleRepo.all)
  end

  def create
    person = Person.new(person_params)

    if person.valid?
      PeopleRepo.commit(person)
      render :json => PersonSerializer.to_json(person)
    else
      render :json => PersonSerializer.to_json(person), status: :forbidden
    end
  end

  private

  def person_params
    params["person"].select { |k,v| person_keys.include?(k.to_sym) }
  end

  def person_keys
    [:first_name, :last_name]
  end
end

class PeopleSerializer
  def self.to_json(people)
    Jbuilder.encode do |json|
      json.array! people do |person|
        json.first_name person.first_name
        json.last_name person.last_name
        json.full_name person.full_name
      end
    end
  end
end

class PersonSerializer
  def self.to_json(person)
    Jbuilder.encode do |json|
      json.first_name person.first_name
      json.last_name person.last_name
      json.full_name person.full_name
    end
  end
end
