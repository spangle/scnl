class CreateMessagePosts < ActiveRecord::Migration
  def self.up
    create_table :message_posts do |t|
      t.integer :poster_id
      t.string :subject
      t.text :message

      t.timestamps
    end
		add_index :message_posts, :poster_id
  end

  def self.down
    drop_table :message_posts
  end
end
