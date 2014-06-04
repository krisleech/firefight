class AssignmentRepo
  include Singleton

  def all
    data
  end

  def commit(assignment)
    raise 'assignment not valid' unless assignment.valid?
    data.push(assignment)
  end

  def delete_all
    data.clear
  end

  def self.all
    instance.all
  end

  def self.commit(assignment)
    instance.commit(assignment)
  end

  def self.delete_all
    instance.delete_all
  end

  private

  def data
    @data ||= []
  end
end

