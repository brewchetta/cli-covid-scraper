class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :state_initials
      t.integer :tested
      t.integer :positive
      t.integer :deaths
      t.float :tested_per_million
      t.float :positive_per_tested
      t.float :deaths_per_positive
      t.float :deaths_per_million
      t.float :last_updated
      t.integer :population
      t.float :deaths_per_day_10_year_avg
      t.string :date_recorded
    end
  end
end
