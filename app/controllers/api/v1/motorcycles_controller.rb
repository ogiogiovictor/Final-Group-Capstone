class Api::V1::MotorcyclesController < ApplicationController
  before_action :set_motorcycle, only: %i[show update destroy]
  before_action :set_user, only: %i[index show update destroy]

  def index
    @motorcycles = @user.motorcycles

    render json: { status: 200, data: @motorcycles }
  end

  def all_motorcycles
    @motorcycles = Motorcycle.all
    render json: { status: 200, data: @motorcycles }
  end

  def show
    if @motorcycle
      render json: { motorcycle: @motorcycle, status: 201 }
    else
      render json: { error: @motorcycle.errors.full_messages, status: 402 }
    end
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_params)

    if @motorcycle.save
      render json: { status: 201, message: 'motorcycle created successfully', data: @motorcycle }
    else
      render json: { error: @motorcycle.errors.full_messages, status: 402 }
    end
  end

  def update
    @updated_motorcycle = @motorcycle.update!(motorcycle_params)

    if @updated_motorcycle
      render json: { data: @updated_motorcycle, message: 'motorcycle updated successfully!' }
    else
      render json: { error: @updated_motorcycle, status: 422 }
    end
  end

  def destroy
    @action = @motorcycle.destroy

    if @action
      render json: { message: 'motorcycle Deleted!' }
    else
      render json: { message: action.errors, status: :unprocessable_entity }
    end
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:user_id,
       :model, :description, :deposit_fee, :finance_fee, :total_amount, :duration. :apr_percent)
  end

  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  end

  def set_user
    @user = User.includes(:motorcycles).find(params[:user_id])
  end
end
