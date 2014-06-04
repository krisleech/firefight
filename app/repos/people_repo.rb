class PeopleRepo
  include Singleton

  def all
    data
  end

  def commit(person)
    raise 'person not valid' unless person.valid?
    data.push(person)
  end

  def self.all
    instance.all
  end

  def self.commit(person)
    instance.commit(person)
  end

  private

  def data
    @data ||= []
  end
end
