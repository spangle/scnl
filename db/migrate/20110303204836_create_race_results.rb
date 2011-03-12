class CreateRaceResults < ActiveRecord::Migration
  def self.up
    create_table :race_results do |t|
      t.integer :match_id
      t.integer :finisher_id
      t.integer :place

      t.timestamps
    end
		add_index :race_results, :match_id
		add_index :race_results, :finisher_id
    add_index :race_results, [:match_id, :finisher_id, :place], :unique => true
  end

  def self.down
    drop_table :race_results
  end
end
