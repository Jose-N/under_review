class AddScreenshotToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :screenshot, :string
  end
end
