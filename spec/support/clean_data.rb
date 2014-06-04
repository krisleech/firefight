RSpec.configure do |config|
  config.before(:each) do
    PeopleRepo.delete_all if defined?(PeopleRepo)
    AssignmentRepo.delete_all if defined?(AssignmentRepo)
  end
end
