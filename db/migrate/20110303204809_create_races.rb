class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.string :name
      t.string :location
      t.integer :selector_id
      t.date :racedate

      t.timestamps
    end
		add_index :races, :selector_id
		add_index :races, :racedate
  end

  def self.down
    drop_table :races
  end
end
