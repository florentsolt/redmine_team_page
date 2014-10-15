RedmineApp::Application.routes.draw do
  match '/team', :to => 'team#index'
end
