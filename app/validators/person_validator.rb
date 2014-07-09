require 'people_repo'

class PersonValidator
  def initialize(repo = PeopleRepo)
    @repo = repo
  end

  def valid?(person)
    @person = person
    person.valid? & id_unique?
  end

  def self.valid?(person)
    new.valid?(person)
  end

  private

  def id_unique?
    if @repo.find_by_id(@person.id)
      return false
    else
      return true
    end
  end
end
