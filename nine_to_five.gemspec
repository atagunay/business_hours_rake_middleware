require_relative "lib/nine_to_five/version"

Gem::Specification.new do |spec|
  spec.name        = "nine_to_five"
  spec.version     = NineToFive::VERSION
  spec.authors     = ["atagunay"]
  spec.email       = ["atagunay9@gmail.com"]
  spec.summary     = "Rails plugin to enforce business hours."
  spec.description = "Restricts your Rails app to only provide requests during business hours using a Rack middleware"
    spec.license     = "MIT"

  spec.metadata['allowed_push_host'] = ''

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.0"
end
