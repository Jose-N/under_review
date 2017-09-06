class AddNotNullConstraintToScreenshotInSubmissions < ActiveRecord::Migration[5.1]
  def up
    change_column :submissions, :screenshot, :string, null: false
  end
  def down
    change_column :submissions, :screenshot, :string
  end
end
