require 'will_paginate/view_helpers/action_view'

module WillPaginate
  module ActionView
    def will_paginate(collection = nil, options = {})
      options[:renderer] ||= BootstrapLinkRenderer
      options[:next_label] = "« Older posts"
      options[:previous_label] = "Newer posts »"
      super.try :html_safe
    end

    class BootstrapLinkRenderer < LinkRenderer
      protected

      def html_container(html)
        container_attributes[:class] = 'post-nav archive-nav'
        tag :div, html, container_attributes
      end

      def previous_page
        num = @collection.current_page > 1 && @collection.current_page - 1
        previous_or_next_page(num, @options[:previous_label], 'post-nav-newer')
      end
      
      def next_page
        num = @collection.current_page < total_pages && @collection.current_page + 1
        previous_or_next_page(num, @options[:next_label], 'post-nav-older')
      end

      def page_number(page)
        
      end

      def previous_or_next_page(page, text, classname)
        link(text, page, :class => classname) if page
      end

    end
  end
end