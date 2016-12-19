class BlogsController < ApplicationController
	before_action :already_logged?, only: [:login, :login_post]
	before_action :authenticate!, only: [:new, :create, :edit, :update, :destroy, :logout]

	rescue_from ActiveRecord::RecordNotFound do
		render template: "/errors/404", status: 404
  	end

	def index
		@blogs = Blog.order('id DESC')
		@blogs = @blogs.paginate(page: params[:page], per_page: 2)
		@page = params[:page] == '1' ? false : params[:page]
		@total = 1 + Blog.count / 2 if @page
	end

	def new

	end

	def single
		@blog = Blog.find params[:id]
		@next_post = @blog.next
		@prev_post = @blog.prev
	end

	def create
		@blog = Blog.create blog_params

    	if @blog.save
      		redirect_to '/'
    	else
      		render :new
    	end
  	end

  	def edit
  		@blog = Blog.find params[:id]
  	end

  	def update
  		@blog = Blog.find params[:id]
  		if @blog.update_attributes! blog_params
		  	redirect_to blog_path @blog
		else
		  	render 'edit_blog'
		end
  	end

  	def destroy
  		@blog = Blog.find params[:id]
		@blog.destroy
		redirect_to '/'
  	end

	def login

	end

	def login_post
		if account_params[:password] == APP_CONFIG['password']
			session[:account] = true
			redirect_to '/'
		else
			render 'login'
		end
	end

	def logout
		session[:account] = nil if account_login?
		redirect_to '/'
	end

	def page
		
	end

	def error404
		render template: "/errors/404", status: 404
	end

	private
	def account_params
		params.permit(:password)
	end

	def blog_params
		params.require(:blog).permit(:title, :content, :blog_tags)
	end

	def authenticate!
		redirect_to '/' unless account_login?
	end

	def already_logged?
		 redirect_to '/' if account_login?
	end

end