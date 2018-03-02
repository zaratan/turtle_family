class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found(e)
    render json: { errors: [{ detail: e.message }] }, status: :not_found
  end
end
