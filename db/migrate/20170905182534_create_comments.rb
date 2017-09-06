class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.text :body

      t.timestamps
    end
  end
end
