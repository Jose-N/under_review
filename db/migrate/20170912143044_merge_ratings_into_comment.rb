class MergeRatingsIntoComment < ActiveRecord::Migration[5.1]
  def change
    drop_table :ratings 
    add_column :comments, :troll, :integer, null: false
    add_column :comments, :funny, :integer, null: false
    add_column :comments, :story, :integer, null: false
    add_column :comments, :helpful, :integer, null: false
  end
end
