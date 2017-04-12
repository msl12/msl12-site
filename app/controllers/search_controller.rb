class SearchController < ApplicationController

  def index
    params[:q] ||= ''

    search_params = {
        query: {
            simple_query_string: {
                query: params[:q],
                default_operator: 'AND',
                minimum_should_match: '70%',
                fields: %w(title content)
            }
        }
    }
    @response = Blog.__elasticsearch__.search(search_params).paginate(page: params[:page], per_page: 2)
    @total = (1 + @response.results.total) / 2
  end

end