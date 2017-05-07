Rails.application.routes.draw do

	root "blogs#index"

	get 'about-me' => 'blogs#page'

	resources :blogs, only: %i(new create edit update destroy)
	get 'blogs/:id' => 'blogs#single'

	resources :photos, only: %i(create)

	get 'login' => 'blogs#login'
	post 'login_post' => 'blogs#login_post'
	delete 'logout' => 'blogs#logout'

	get 'tags/:name' => 'tags#show', :as => 'tag'

	get 'search', to: 'search#index'

  get 'feed', to: 'blogs#feed', defaults: { format: 'xml' }

	match '*path', via: :all, to: 'blogs#error404'

end