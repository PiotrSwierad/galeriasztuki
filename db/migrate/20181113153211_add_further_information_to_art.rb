class AddFurtherInformationToArt < ActiveRecord::Migration[5.2]
  def change
  	add_column :arts, :technique, :string
  	add_column :arts, :year, :integer
  	add_column :arts, :price, :integer
  	add_column :arts, :availability, :boolean
  end
end
