class AddForeignKeysToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :submission_id, :integer, null: false
    add_column :ratings, :submission_id, :integer, null: false
    create_table :submission_keywords do |t|
      t.integer :submission_id, null: false
      t.integer :keyword_id, null: false

      t.timestamps 
    end
  end
end
