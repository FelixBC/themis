module Api::V1
  class LeaguesController < ApplicationController
    before_action :authenticate_user!

    def index
      leagues = League.where(group_id: current_user.group_id)
      render json: leagues
    end

    def show
      @league = League.find(params[:id])
      render json: @league
    end

    def create
      league = League.new(league_params.merge(group_id: current_user.group_id))
      if league.save
        render json: league, status: :created
      else
        render json: { errors: league.errors.full_messages }, status: :unprocessable_entity
      end
    end
    private
    def league_params
      params.require(:league).permit(:name, :start_date, :end_date, :group_id)
    end

  end
end