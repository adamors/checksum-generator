Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'checksums#new'

  resource :checksums, only: %i[new create]
end
