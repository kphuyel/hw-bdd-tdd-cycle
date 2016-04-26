Rottenpotatoes::Application.routes.draw do
  
  # map '/' to be a redirect to '/movies'
  root 'movies#index'
  #root :to => redirect('/movies')
  resources :movies

  
  #get 'same_director' => 'movies#same_director'
  get 'movies/:id/same_director' => 'movies#same_director', :as => :same_director
end
