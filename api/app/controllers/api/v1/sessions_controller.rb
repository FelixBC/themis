module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate!
      skip_before_action :transform_params, only: :create

      def create
        user = User.find_by(email: params[:email])
        return head :unauthorized unless user

        payload = { user_id: user.id, role: user.role.name }
        token   = JWT.encode(payload, Rails.application.secret_key_base)

        render json: { token: token, user: { id: user.id, name: user.name, role: user.role.name } }
      end
    end
  end
end
