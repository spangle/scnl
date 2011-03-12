class AddPointsToRaceResults < ActiveRecord::Migration
  def self.up
    add_column :race_results, :points, :integer
  end

  def self.down
    remove_column :race_results, :points
  end
end
