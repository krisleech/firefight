require 'active_model'

class Person
  include ActiveModel::Model

  attr_accessor :first_name, :last_name
  attr_reader   :id

  validates :id, :first_name, :last_name, :presence => true

  def initialize(attrs = {})
    super(attrs)
    @id ||= SecureRandom.uuid
  end

  def full_name
    [first_name, last_name].join(' ')
  end
end
