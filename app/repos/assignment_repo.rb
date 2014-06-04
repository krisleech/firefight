class AssignmentRepo
  include Singleton

  def all
    data
  end

  def commit(assignment)
    raise 'assignment not valid' unless assignment.valid?
    data.push(assignment)
  end

  def self.all
    instance.all
  end

  def self.commit(assignment)
    instance.commit(assignment)
  end

  private

  def data
    @data ||= []
  end
end

