class Blog < ApplicationRecord
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

	acts_as_taggable

	validates :title, presence: true
	validates :content, :presence => true

	scope :recent, -> { order(id: :desc) }

	mapping do
		indexes :title
		indexes :content
  end

	def as_indexed_json(_options={})
		{
				title: title,
				content: content
		}
	end

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

	def increment_view_count
		cache_key = "#{APP_CONFIG['cache_prefix']}/#{id}/view_count"
		blog_view_count = Rails.cache.read cache_key
		if blog_view_count
			blog_view_count += 1
			Rails.cache.write cache_key, blog_view_count
			update_attribute(:view_count, blog_view_count) if blog_view_count % 10 == 0
		else
			Rails.cache.write cache_key, 1
		end
	end

end