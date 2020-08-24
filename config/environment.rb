require "bundler/setup"
Bundler.require

require "pry"
require "uri"
require "net/http"
require "open-uri"

require_relative "../lib/scraper"
require_relative "../lib/state-data"
require_relative "../lib/viewer"
