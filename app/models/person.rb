class Person
  include ActiveModel::Model

  attr_accessor :id, :first_name, :last_name

  def full_name
    [first_name, last_name].join(' ')
  end
end
