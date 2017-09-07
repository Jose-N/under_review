class AddNullConstraintToCommentsBody < ActiveRecord::Migration[5.1]
  def up
    change_column :comments, :body, :text, null: false
  end
  def down
    change_column :comments, :body, :text
  end
end
