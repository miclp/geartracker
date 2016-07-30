class CreateGearItems < ActiveRecord::Migration
  def change
    create_table :gear_items do |t|
      t.belongs_to :user, index: true #needed this to create a gear_item with user_id
      t.string :name
      t.string :description
      t.string :gear_type
      t.integer :value
      t.integer :year
      t.text :image_url
      t.string :notes
    end
  end
end
