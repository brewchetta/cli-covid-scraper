class Viewer

  def initialize
    Scraper.new.fetch_data
  end

  def run
    binding.pry
  end

end
