class Blog < ApplicationRecord

	acts_as_taggable

	validates :title, presence: true
	validates :content, :presence => true

	scope :recent, -> { order(id: :desc) }

	def blog_tags
		self.tag_list.join ','
  	end
  
  	def blog_tags=(tags)
  		self.tag_list = tags.split(',').uniq.join(',')
  	end

	def next
		Blog.where("id > #{self.id}").first
	end

	def prev
		Blog.where("id < #{self.id}").last
	end

end