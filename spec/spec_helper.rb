require 'webmock/rspec'
require 'vcr'
require 'simplecov'
SimpleCov.start('rails')

WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
  config.ignore_hosts '127.0.0.1'
end

RSpec.configure do |config|
  require 'capybara/rspec'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
