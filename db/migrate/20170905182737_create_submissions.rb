class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.string :title, null: false
      t.string :description
      t.string :url
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
