# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require "rack/test"
require "pry"

require "./spec/support/simplecov"
require "./spec/support/rspec_bench"

require 'warning'
require 'roda'

# https://github.com/jeremyevans/roda/issues/179
Gem.loaded_specs['roda'].full_require_paths.each do |path|
  Warning.ignore(:missing_ivar, path)
end

OUTER_APP = Rack::Builder.parse_file("config.ru").first

module Appy
  def app
    OUTER_APP
  end
end

RSpec.configure do |config|
  config.include(Rack::Test::Methods, type: :request)
  config.include(Appy, type: :request)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus

  config.example_status_persistence_file_path = "spec/examples.txt"

  config.disable_monkey_patching!

  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  # config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end
