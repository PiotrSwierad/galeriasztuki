class Art < ApplicationRecord
	has_one_attached :image

	#scope :title_contains, -> (title) { where("title like ?", "#{title}%") }

	def self.search(title_contains)
		if title_contains
			where("title like ?", "#{title_contains}%")
		else
			all
		end
	end

	validates :author, :presence => true
	validates :title, :presence => true
	validates :year, :presence => true
	validates :image, :presence => true
end
