module V1
  class TurtlesController < ApplicationController
    def create
      turtle = Turtle.create(create_params)
      if turtle.errors.empty?
        render json: turtle
      else
        render json: { errors: turtle.errors }, status: :forbidden
      end
    end

    def index
      turtles = Turtle.order(:created_at)
      render json: turtles
    end

    def show
      turtle = Turtle.find(params[:id])
      render json: turtle
    end

    def update
      turtle = Turtle.find(params[:id])
      turtle.update(update_params)
      if turtle.errors.empty?
        render json: turtle
      else
        render json: { errors: turtle.errors }, status: :forbidden
      end
    end

    def destroy
      turtle = Turtle.find(params[:id])
      turtle.destroy
      head :no_content
    end

    private

    def create_params
      params.permit(:name, :color, :email)
    end

    def update_params
      params.permit(:name, :color, :email)
    end
  end
end
