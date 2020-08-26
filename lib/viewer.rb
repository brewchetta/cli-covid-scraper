class Viewer

  def initialize
    Scraper.new.fetch_data
  end

  def run
    @states = State.today.length ? State.today : State.most_recent
    ARGV.reject!{|arg| arg == "update"}
    if ARGV.length > 0
      ARGV.each { |state| display_state(state) }
    else
      display_general_info
    end
  end

  def display_general_info
    puts "\n================".colorize(:blue)
    display_country
    display_highest_by
    display_last_checked
    puts "================\n".colorize(:blue)
  end

  def display_highest_by
    top_positive = @states.max_by(3, &:positive)
    top_deaths = @states.max_by(3, &:deaths)
    puts "Highest Deaths => #{top_deaths.map {|state| display_info_for_value(state, :deaths)}.join(" | ")}"
    puts "Highest Number of Cases => #{top_positive.map {|state| display_info_for_value(state, :positive) }.join(" | ")}"
  end

  def display_info_for_value(state, value)
    "#{state.state_initials}: #{state.send(value).commas}".colorize :red
  end

  def display_country
    puts "USA =>" + " Total positive: #{State.total(:positive).commas} ".colorize(:red) + "|" + " Total deaths: #{State.total(:deaths).commas} ".colorize(:red) + "|" + " Percent Positive: #{(State.total(:positive).to_f / State.total(:population) * 100).round(3)}%".colorize(:red)
    puts "Average => " + "Positives: #{State.avg(:positive).to_i.commas} ".colorize(:red) + "|" + " Deaths: #{State.avg(:deaths).to_i.commas}".colorize(:red)
  end

  def display_last_checked
    puts "Last updated #{@states.min_by(&:last_updated).last_updated.to_s.colorize :red} hours ago"
  end

  def display_state(state_name)
    use_commas = Proc.new {|column| column.class == Integer ? column.commas : column }
    if state = @states.find {|st| st.state_initials == state_name.upcase }
      puts "\n================".colorize(:blue)
      State.column_names.slice(1,100).each do |column|
        puts "#{column.upcase.sub("_", " ")}: " + "#{use_commas.call(state.send(column))}".colorize(:red)
      end
      puts "================\n".colorize(:blue)
    else
      puts "\n================".colorize(:blue)
      puts "Couldn't find " + state_name.colorize(:red)
      puts "================\n".colorize(:blue)
    end
  end

end
