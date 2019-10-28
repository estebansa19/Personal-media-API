class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :update, :destroy]

  def index
    @productions = Production.all

    if params[:production_kind_id]
      @productions = Production.where(production_kind_id: params[:production_kind_id])
    end

    render json: { data: @productions }, status: :ok
  end

  def show
    render json: { data: @production }, status: :ok
  end

  def create
    @production = Production.new(production_params)

    if @production.save
      render json: { data: @production }, status: :ok
    else
      render json: { error: @production.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def update
    if @production.update(production_params)
      render json: { data: @production }, status: :ok
    else
      render json: { data: @production.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def destroy
    @production.destroy
    render json: { data: 'Deleted succesfully' }, status: :ok
  end

  private

  def production_params
    params.permit(:title, :description, :rate, :image, :production_kind_id)
  end

  def set_production
    begin
      @production = Production.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { data: { error: 'Production not found' } }, status: :not_found
    end
  end
end