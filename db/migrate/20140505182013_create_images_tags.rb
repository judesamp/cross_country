class CreateImagesTags < ActiveRecord::Migration
  def change
    create_table :images_tags, id: false do |t|
      t.integer :tag_id
      t.integer :image_id
    end
  end
end
