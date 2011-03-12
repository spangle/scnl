class CreateRaceRelations < ActiveRecord::Migration
  def self.up
    create_table :race_relations do |t|
      t.integer :event_id
      t.integer :owner_id
      t.integer :pilot_id

      t.timestamps
    end
		add_index :race_relations, :event_id
		add_index :race_relations, :owner_id
		add_index :race_relations, :pilot_id
		add_index :race_relations, [:event_id, :owner_id, :pilot_id], :unique => true
  end

  def self.down
    drop_table :race_relations
  end
end
