class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.integer :fire_engine_id
      t.string :title
      t.text :caption

      t.timestamps
    end
  end
end
