class PeopleRepo
  include Singleton

  class PersonNotValid < StandardError; end

  def all
    data
  end

  def commit(person)
    raise PersonNotValid unless person_valid?(person)
    data.push(person)
    self
  end

  def delete_all
    data.clear
  end

  def count
    data.size
  end

  def self.all
    instance.all
  end

  def self.commit(person)
    instance.commit(person)
  end

  def self.delete_all
    instance.delete_all
  end

  def self.count
    instance.count
  end

  private

  def data
    @data ||= []
  end

  def person_valid?(person)
    person.valid? && !data.map(&:id).include?(person.id)
  end
end
