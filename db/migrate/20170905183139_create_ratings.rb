class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :troll, null: false
      t.integer :funny, null: false
      t.integer :story, null: false
      t.integer :helpful, null: false
      t.integer :comment_id, null: false

      t.timestamps
    end
  end
end
