class StateData

  attr_reader :state_initials, :tested, :positive, :deaths, :tested_per_million, :positive_per_tested, :deaths_per_positive, :deaths_per_million, :last_updated, :population, :deaths_per_day_10_year_avg

  @@all = []

  def initialize(data)
    @state_initials = data[0]
    @tested = data[1].to_i
    @positive = data[2].to_i
    @deaths = data[3].to_i
    @tested_per_million = data[4].to_i
    @positive_per_tested = data[5].to_i
    @deaths_per_positive = data[6].to_i
    @deaths_per_million = data[7].to_i
    @last_updated = data[9].to_i
    @population = data[10].to_i
    @deaths_per_day_10_year_avg = data[11].to_i

    @@all << self
  end

  def self.all
    @@all
  end

  def self.total(value)
    @@all.map{ |row| row.send(value) }.reduce(&:+)
  end

  def self.avg(value)
    totals = self.total value
    totals.to_f / @@all.length
  end

  def find_state(initials)
    @@all.find { |state| state.state_initials.downcase == initials.downcase }
  end

end
