class AddImageDataToImages < ActiveRecord::Migration
  def change
    add_column :images, :image_data, :string
  end
end
