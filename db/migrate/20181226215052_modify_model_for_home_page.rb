class ModifyModelForHomePage < ActiveRecord::Migration[5.2]
  def change
  	add_column :arts, :data_sizex, :integer
  	add_column :arts, :data_sizey, :integer
  	add_column :arts, :data_col, :integer
  	add_column :arts, :data_row, :integer
  end
end
