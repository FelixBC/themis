module Api::V1
  class TeamsController < ApplicationController
    before_action :authenticate_user!

    def index
      teams = Team.where(league_id: params[:league_id]) # Filter by league
      render json: teams
    end

    private
    def team_params
      params.require(:team).permit(:name, :league_id)
    end
  end
end