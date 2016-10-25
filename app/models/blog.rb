class Blog < ApplicationRecord

	validates :title, presence: true
	validates :content, :presence => true

	def next
		Blog.where("id > #{self.id}").first
	end

	def prev
		Blog.where("id < #{self.id}").first
	end

end