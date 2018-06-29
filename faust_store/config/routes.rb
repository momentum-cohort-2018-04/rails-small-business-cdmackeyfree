Rails.application.routes.draw do

  root 'products#index'
  get 'products/list' => 'products#list'
  get 'products/:pid' => 'products#detail'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
