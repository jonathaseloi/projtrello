Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	#Board
	delete '/board/:id', to: 'board#delete', as: :delete_board

	get "/boards", to: "board#index", as: :index_board

	get '/board/:id', to: 'board#show', as: :show_board

	get '/boardinfo/:id', to: 'board#get', as: :get_board

	post '/boards', to: "board#create"

	patch '/boardseditname/:id', to: "board#edit", as: :board_edit_name

	#Column
	delete '/columns/:id', to: 'column#delete', as: :delete_column

	post '/board/:id', to: "column#createtitle", as: :create_column

	get '/columns/:id', to: 'column#get', as: :get_column

	get '/columns/:id/show', to: 'column#show', as: :show_column
	
	patch '/columnseditname/:id', to: "column#edit", as: :column_edit_name

	patch '/columns/:id/move', to: "column#move"

	#Card
	delete '/card/:id', to: 'card#delete', as: :delete_card

	get '/column/:id', to: 'card#getcolumn', as: :get_column_card

	get '/card/:id', to: 'card#get', as: :get_card

	get '/cardmodal/:id', to: 'card#modalshow', as: :get_modalshow_card

	patch '/cardedit/:id', to: "card#edit", as: :edit_card

	patch '/columns/:column_id/cards/:id/move', to: "card#move"

	post "/cardcreate/:id", to: "card#create", as: :create_card

end
