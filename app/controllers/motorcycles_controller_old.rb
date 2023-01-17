class MotorcyclesController < ApplicationController
  before_action :set_motorcycle, only: %i[ show update destroy ]

  # GET /motorcycles
  def index
    #@motorcycles = Motorcycle.all
    #render json: @motorcycles
    @motorcycles = Motorcycle.all.joins(:image_attachment)
    render json: @motorcycles.map { |motorcycle|
      motorcycle.as_json(only: %i[id model description deposit_fee finance_fee total_amount duration apr_percent]).merge(image_path: url_for(motorcycle.image))
      .merge(pictures_path: motorcycle.pictures.map { |picture| url_for(picture) }) }
  
  end

  # GET /motorcycles/1
  def show
    @motorcycle = Motorcycle.find(params[:id])
    render json: @motorcycle.as_json(only: %i[id model description deposit_fee finance_fee total_amount duration apr_percent]).merge(image_path: url_for(@motorcycle.image))
    .merge(pictures_path: @motorcycle.pictures.map { |picture| url_for(picture) })
  end

  # POST /motorcycles
  def create
    @motorcycle = Motorcycle.new(motorcycle_params)
    if @motorcycle.save
      render json: @motorcycle, status: :created, location: @motorcycle
    else
      render json: @motorcycle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /motorcycles/1
  def update
    if @motorcycle.update(motorcycle_params)
      render json: @motorcycle
    else
      render json: @motorcycle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /motorcycles/1
  def destroy
    @motorcycle = Motorcycle.find(params[:id])
    @motorcycle.destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motorcycle
      @motorcycle = Motorcycle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def motorcycle_params
      params.require(:motorcycle).permit(:model, :description, :deposit_fee, :finance_fee, :total_amount, :duration, :apr_percent, :image,  pictures: [])
    end
end
