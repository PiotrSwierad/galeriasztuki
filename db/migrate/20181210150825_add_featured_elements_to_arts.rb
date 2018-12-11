class AddFeaturedElementsToArts < ActiveRecord::Migration[5.2]
  def change
  	add_column :arts, :featured, :boolean
  	add_column :arts, :position, :integer
  end
end
