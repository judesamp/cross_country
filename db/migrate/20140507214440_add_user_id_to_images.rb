class AddUserIdToImages < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :integer
    add_column :images, :user_id, :integer
  end
end
