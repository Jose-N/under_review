class AddingRatingsIntoSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :troll, :integer, null: false
    add_column :submissions, :funny, :integer, null: false
    add_column :submissions, :story, :integer, null: false
    add_column :submissions, :helpful, :integer, null: false
  end
end
