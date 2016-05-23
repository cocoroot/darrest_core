
require 'factory_girl_rails'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # profiling worst 10 examples
  config.profile_examples = 10

  # run examples randomly
  config.order = :random

  # Factory Girl
  config.include FactoryGirl::Syntax::Methods

  # Data Cleaner
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    load Rails.root.join('db', 'seeds', 'master.rb')

    DatabaseCleaner.strategy = :transaction
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

require 'simplecov'
SimpleCov.start 'rails'
