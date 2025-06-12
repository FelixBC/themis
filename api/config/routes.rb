Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'  # Add logout functionality

      get '/games/today', to: 'games#today'     # Games for current date
      get '/games/:id/stats', to: 'games#stats' # Consolidated stats (pitching + basketball)

      get '/leagues/:id/standings', to: 'leagues#standings'
      get '/teams/:id/summary', to: 'teams#summary'

      resources :zones, :groups, :leagues, :teams, :players, :games
      resources :pitching_stats, :basketball_stats, :roles, :users
    end
  end
end