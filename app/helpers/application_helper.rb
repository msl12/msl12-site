module ApplicationHelper

	def recent_posts(recent_num)
		blogs = Blog.recent.limit recent_num

		recent_post_links = []

		blogs.each do |blog|
			link = content_tag(:li, link_to(blog.title, blog_path(blog)))
			recent_post_links << link
		end

		recent_post_links.join("\n").html_safe
	end

  def markdown(text)
		raw GitHub::Markdown.render_gfm text
	end

end