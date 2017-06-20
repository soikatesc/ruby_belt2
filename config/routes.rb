Rails.application.routes.draw do
	root 'users#new'
	post '/users' => 'users#create'
	get '/users/:id' => 'users#show'

	post '/sessions' => 'sessions#create'
	delete 'sessions/:id' => 'sessions#destroy'

	get '/bright_ideas' => 'posts#index'
	post '/posts' => 'posts#create'
	get '/posts/:post_id/likes' => 'posts#like'
	delete '/posts/:post_id' => 'posts#destory'
	get '/bright_ideas/:post_id' => 'posts#show'
end
