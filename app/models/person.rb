require 'active_model'

class Person
  include ActiveModel::Model

  attr_accessor :id, :first_name, :last_name

  validates :first_name, :last_name, :presence => true

  def full_name
    [first_name, last_name].join(' ')
  end
end
