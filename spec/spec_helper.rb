$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
Bundler.require :default
require "pubg_rb"
require 'dotenv'
require 'webmock/rspec'

Dotenv.load

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.raise_errors_for_deprecations!
end

require 'vcr'
VCR.configure do |vcr|
  vcr.configure_rspec_metadata!

  vcr.filter_sensitive_data("<TEST_PUBG_API>") do
    test_pugb_api_token
  end

  vcr.default_cassette_options = {
    serialize_with: :json,
    preserve_exact_body_bytes: true,
    record: ENV["TRAVIS"] ? :none : :once
  }

  vcr.cassette_library_dir = "spec/cassettes"
  vcr.hook_into :webmock
end

def test_pugb_api_token
  ENV.fetch("TEST_PUBG_API", "097cd31f3a08fef202b3eefd18853d69")
end