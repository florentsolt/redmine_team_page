RedmineApp::Application.routes.draw do
  get '/team', :to => 'team#index'
end
