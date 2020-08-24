class Scraper

  def fetch_data
    uri = open("https://coronavirusapi.com/")
    doc = Nokogiri::HTML.parse(uri)
    full_table = doc.css("#fulltable tbody")
    process_states_data(full_table)
  end

  def process_states_data(table)
    table.css('tr')[1..53].map {|row| create_state_data(row) }
  end

  def create_state_data(row)
    data = row.children.map {|d| d.text.strip.chomp }.reject(&:empty?)
    StateData.new(data)
  end

end
