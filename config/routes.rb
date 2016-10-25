Rails.application.routes.draw do

	root "blogs#index"

	get '/about-me' => 'blogs#page'

	resources :blogs, only: %i(new create edit update destroy)
	get '/blogs/:id' => 'blogs#single'

	get 'login' => 'blogs#login'
	post 'login_post' => 'blogs#login_post'
	delete 'logout' => 'blogs#logout'

	match '*path', via: :all, to: 'blogs#error404'

end