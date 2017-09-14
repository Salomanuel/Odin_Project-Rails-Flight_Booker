Rails.application.routes.draw do
	root 'flights#search'

	get 'flights/search'

	resources :flights, 		only: [ :index, :search ]
	resources :airports, 		only: [ :show ]
	resources :bookings,  	only: [ :show, :new, :create ]
	resources :passengers,  only: [ :show, :new, :create ]
end
