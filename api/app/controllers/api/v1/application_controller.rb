module Api
  module V1
    class ApplicationController < ActionController::API
      before_action :transform_params

      before_action :authenticate!

      private

      def transform_params
        request.parameters.deep_transform_keys!(&:underscore)
      end

      def authenticate!
        header = request.headers['Authorization']
        token  = header&.split(' ')&.last
        payload, _ = JWT.decode(token, Rails.application.secret_key_base)
        @current_user = User.find(payload['user_id'])
      rescue JWT::DecodeError, ActiveRecord::RecordNotFound
        head :unauthorized
      end
    end
  end
end
