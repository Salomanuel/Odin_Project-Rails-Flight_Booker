Rails.application.routes.draw do
	

	get '/search', to: 'flights#index'
	get '/about',  to: 'flights#about'
	root 'flights#about'

	resources :flights, 		only: [ :index, :search ]
	resources :airports, 		only: [ :show ]
	resources :bookings,  	only: [ :show, :new, :create, :index ]
	resources :passengers,  only: [ :show, :new, :create ]
end
