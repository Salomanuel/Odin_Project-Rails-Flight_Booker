Rails.application.routes.draw do
	root 'flights#index'

	resources :flights, 	only: [ :index ]
	resources :airports, 	only: [ :show ]
end
