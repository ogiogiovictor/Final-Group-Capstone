class Api::V1::BookingsController < ApplicationController
  before_action :set_user, only: %i[index show update destroy]
  before_action :set_booking, only: %i[show update destroy]

  def index
    @bookings = @user.bookings

    render json: { status: 200, data: @bookings }
  end

  def show
    render json: { booking: @booking, status: 201 }
  end

  def create
    @booking = Booking.new(booking_params)
    # @booking.location = ??? to be reviewed
    @booking.date = Date.new
    @booking.reserved_from = Date.new
    @booking.reserved_until = Date.new
    @booking.user = User.find(params[:user_id])
    @booking.motorcycle = Motorcycle.find(params[:motorcycle_id])

    if @booking.save
      render json: { status: 201, message: 'resevation created successfully', data: @booking }
    else
      render json: { error: @booking.errors.full_messages, status: 402 }
    end
  end

  def update; end

  def destroy
    @action = @booking.destroy

    if @action
      render json: { message: 'Booking Deleted!' }
    else
      render json: { message: @action.errors, status: :unprocessable_entity }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:location:, :date, :reseved_from, :reserved_until, :user_id, :motorcycle_id)
  end

  def set_user
    @user = User.includes(:bookings).find(params[:user_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
