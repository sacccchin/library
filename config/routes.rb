Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get 'borrow_list', to: 'borrows#index'
	resources :books do
		resources :borrows
	end

	root 'books#index'
end
