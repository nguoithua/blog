# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "my-theme"
  spec.version       = "0.0.1"
  spec.authors       = [""]
  spec.email         = [""]

  spec.summary       = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f|
    f.match(%r!^((assets\/(css|img|js\/[a-z])|_(includes|layouts|sass|config|data|tabs|plugins))|README|LICENSE|index|feed|app|sw|404|robots)!i)
  }

  spec.metadata = {
    "plugin_type"       => "theme"
  }

  spec.add_runtime_dependency "jekyll", "~> 4.1"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-redirect-from", "~> 0.16"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.7"
  spec.add_runtime_dependency "jekyll-archives", "~> 2.2"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"

end
