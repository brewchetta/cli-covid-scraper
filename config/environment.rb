# Gems
require "bundler/setup"
Bundler.require
require "pry"
require "uri"
require "net/http"
require "open-uri"

# Globals
TODAY = Time.now.to_s.split(" ")[0]

# App
require_relative "adapter"
require_relative "monkey-patch"
require_all "lib"
