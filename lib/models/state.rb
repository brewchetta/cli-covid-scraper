class State < ActiveRecord::Base

  # gets states which have a matching date_recorded
  def self.today
    self.find_by_sql("SELECT * FROM states WHERE date_recorded = '#{TODAY}'")
  end

  # adds up total of a value for today's date
  def self.total(value)
    self.today.map{ |row| row.send(value) }.reduce(&:+)
  end

  # finds an average of a value for today's date
  def self.avg(value)
    totals = self.total value
    (totals.to_f / self.today.length).round(1)
  end

end
