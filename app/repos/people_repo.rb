require 'singleton'
require 'lupo'

class PeopleRepo
  include Singleton
  include Lupo.enumerable(:data)

  class PersonNotValid < StandardError; end

  def initialize
    @data = []
  end

  def all
    data
  end

  def commit(person)
    data.push(person)
    self
  end

  def delete_all
    data.clear
  end

  def count
    data.size
  end

  def find_by_id(id)
    find { |p| p.id == id }
  end

  # expose instance methods at class level
  def self.method_missing(method_name, *args, &block)
    self.instance.respond_to?(method_name) ? instance.send(method_name, *args, &block) : super
  end

  private

  attr_reader :data
end
