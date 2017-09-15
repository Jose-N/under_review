require "coveralls"
Coveralls.wear!('rails')
require 'database_cleaner'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {
    js_errors: false,
    phantomjs_options: ['--ignore-ssl-errors=yes', '--ssl-protocol=any'],
    debug: false,
    timeout: 500,
    phantomjs: File.absolute_path(Phantomjs.path)
  })
end

Capybara.javascript_driver = :poltergeist
Capybara.server_port = 3001

RSpec.configure do |config|
  config.before :each do
    ActionMailer::Base.deliveries.clear
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
