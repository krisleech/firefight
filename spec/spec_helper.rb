APP_ROOT = Pathname(File.dirname(__FILE__)).join('..')

require 'faker'
require 'pry'

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.after(:each) do
    PeopleRepo.delete_all if defined?(PeopleRepo)
  end
end

require 'spec_requirer'

SpecRequirer.setup(app_root:   APP_ROOT.join('app'),
                   components: ['models', 'repos', 'validators'])
