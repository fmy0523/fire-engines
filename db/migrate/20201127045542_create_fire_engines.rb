class CreateFireEngines < ActiveRecord::Migration[5.2]
  def change
    create_table :fire_engines do |t|
      t.text :fireengine_name
      t.string :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
