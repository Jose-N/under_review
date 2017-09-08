class AddUsernameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, null: false
    add_column :ratings, :user_id, :integer, null: false
  end
end
