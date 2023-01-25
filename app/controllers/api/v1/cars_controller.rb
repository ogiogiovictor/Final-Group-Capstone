# frozen_string_literal: true

module Api
  module V1
    class CarsController < ApplicationController
      before_action :set_car, only: %i[show update destroy]
      before_action :set_user, only: %i[index show update destroy]

      def index
        @cars = @user.cars.page params[:page]

        render json: { status: 200, data: @cars }
      end

      def all_cars
        @cars = Car.all
        render json: { status: 200, data: @cars }
      end

      def show
        if @car
          render json: { car: @car, status: 201 }
        else
          render json: { error: @car.errors.full_messages, status: 402 }
        end
      end

      def create
        @car = Car.new(car_params)

        if @car.save
          render json: { status: 201, message: 'car created successfully', data: @car }
        else
          render json: { error: @car.errors.full_messages, status: 402 }
        end
      end

      def update
        @updated_car = @car.update!(car_params)

        if @updated_car
          render json: { data: @updated_car, message: 'car updated successfully!' }
        else
          render json: { error: @updated_car, status: 422 }
        end
      end

      def destroy
        @action = @car.destroy

        if @action
          render json: { message: 'car Deleted!' }
        else
          render json: { message: action.errors, status: :unprocessable_entity }
        end
      end

      private

      def car_params
        params.require(:car).permit(:user_id, :brand, :model, :release_year, :color, :transmission, :seats, :wheel_drive,
                                    :price, :image_link)
      end

      def set_car
        @car = Car.find(params[:id])
      end

      def set_user
        @user = User.includes(:cars).find(params[:user_id])
      end
    end
  end
end
