class AddTrackToRaces < ActiveRecord::Migration
  def self.up
    add_column :races, :track, :string
  end

  def self.down
    remove_column :races, :track
  end
end
