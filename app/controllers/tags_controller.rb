class TagsController < ApplicationController

	def show
		@blogs = Blog.tagged_with(params[:name]).order('created_at DESC').paginate(page: params[:page], per_page: 2)
		raise ActiveRecord::RecordNotFound if @blogs.blank?
		@total = 1 + @blogs.count / 2
	end

end