class CreateFeaturedArts < ActiveRecord::Migration[5.2]
  def change
    create_table :featured_arts do |t|
      t.integer :x_coord
      t.integer :y_coord
      t.references :art, foreign_key: true

      t.timestamps
    end
  end
end
