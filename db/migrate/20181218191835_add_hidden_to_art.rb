class AddHiddenToArt < ActiveRecord::Migration[5.2]
  def change
  	add_column :arts, :hidden, :boolean
  end
end
