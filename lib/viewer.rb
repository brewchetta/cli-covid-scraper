class Viewer

  def initialize
    Scraper.new.fetch_data
  end

  def run
    display_country
    display_highest_by
    display_last_checked
  end

  def display_highest_by
    states = State.today
    top_positive = states.max_by(3, &:positive)
    top_deaths = states.max_by(3, &:deaths)
    puts "Highest Deaths => #{top_deaths.map {|state| display_info_for_value(state, :deaths)}.join(" | ")}"
    puts "Highest Number of Cases => #{top_positive.map {|state| display_info_for_value(state, :positive) }.join(" | ")}"
  end

  def display_info_for_value(state, value)
    "#{state.state_initials}: #{state.send(value).commas}".colorize :red
  end

  def display_country
    puts "USA => Total positive: #{State.total(:positive).commas} | Total deaths: #{State.total(:deaths).commas} | Percent Positive: #{(State.total(:positive).to_f / State.total(:population) * 100).round(3)}%".colorize :blue
    puts "Average => " + "Positives: #{State.avg(:positive).to_i.commas} ".colorize(:red) + "|" + " Deaths: #{State.avg(:deaths).to_i.commas}".colorize(:red)
  end

  def display_last_checked
    puts "Last updated #{State.today.min_by(&:last_updated).last_updated.to_s.colorize :red} hours ago"
  end

end
