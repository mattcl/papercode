Papercode::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  get "/pages/*id" => 'pages#show', :as => :page, :format => false

  root :to => 'pages#show', :id => 'home'
end
