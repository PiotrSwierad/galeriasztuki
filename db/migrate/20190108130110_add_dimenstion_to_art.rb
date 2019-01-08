class AddDimenstionToArt < ActiveRecord::Migration[5.2]
  def change
  	add_column :arts, :width, :integer
  	add_column :arts, :height, :integer
  end
end
