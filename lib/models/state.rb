class State < ActiveRecord::Base

  # gets states which have a matching date_recorded
  def self.get_by_date(date)
    self.find_by_sql("SELECT * FROM states WHERE date_recorded = '#{date}'")
  end

  def self.today
    self.get_by_date(TODAY)
  end

  def self.most_recent
    most_recent_date = self.all.max_by(&:date_recorded).date_recorded
    self.get_by_date(most_recent_date)
  end

  # adds up total of a value for today's date
  def self.total(value)
    self.most_recent.map{ |row| row.send(value) }.reduce(&:+)
  end

  # finds an average of a value for today's date
  def self.avg(value)
    totals = self.total value
    (totals.to_f / self.today.length).round(1)
  end

end
