class Scraper


  def fetch_data
    @output = "\rGathering today's data..."
    # scrape if no data recorded today or update forced
    if State.today.length == 0 || ARGV.include?("update")
      print "Deleting stale data..."
      uri = open("https://coronavirusapi.com/")
      doc = Nokogiri::HTML.parse(uri)
      full_table = doc.css("#fulltable tbody")
      State.today.each {|s| s.delete; print "."}
      puts "\n"
      print @output
      process_states_data(full_table)
      puts "\n"
    end
  rescue
    puts "\nScrape unsuccessful...".colorize :red
  end

  def process_states_data(table)
    # split into rows for states
    table.css('tr')[1..53].map {|row| create_state_data(row) }
  end

  def create_state_data(row)
    data = row.children.map {|d| d.text.strip.chomp }.reject(&:empty?)
    hash_data = {
      state_initials: data[0],
      tested: data[1].to_i,
      positive: data[2].to_i,
      deaths: data[3].to_i,
      tested_per_million: data[4].to_f,
      positive_per_tested: data[5].to_f,
      deaths_per_positive: data[6].to_f,
      deaths_per_million: data[7].to_f,
      last_updated: data[9].to_f,
      population: data[10].to_i,
      deaths_per_day_10_year_avg: data[11].to_f,
      date_recorded: Time.now.to_s.split(" ")[0]
    }
    State.create(hash_data)
    @output += "."
    print @output
  end

end
