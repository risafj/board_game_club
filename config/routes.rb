Rails.application.routes.draw do
  # The left-hand side is what the URL will look like, the right-hand side is how Rails will find it.
  # For the friends URL, specifying the id will let you delete the friends for the member with a specific id number.
  post 'games/', to: 'games#create'
  delete 'games/', to: 'games#delete'
  post 'member/', to: 'members#create'
  delete 'member/', to: 'members#delete'
  post 'member/:id/friends', to: 'members#add_friends'
  delete 'member/:id/friends', to: 'members#delete_friends'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
