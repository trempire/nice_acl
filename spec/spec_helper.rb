require "bundler/setup"
require "nice_acl"

require "rails/all"
require "ammeter/init"
load File.dirname(__FILE__) + "/support/active_record.rb"
establish_connection

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
