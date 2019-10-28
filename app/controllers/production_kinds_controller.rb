class ProductionKindsController < ApplicationController
  before_action :set_production_kind, only: [:show, :update, :destroy]

  def index
    @production_kinds = ProductionKind.all
    render json: { data: @production_kinds }, status: :ok
  end

  def create
    @production_kind = ProductionKind.new(production_kind_params)

    if @production_kind.save
      render json: { data: @production_kind }, status: :created
    else
      render json: { data: { error: "Can't create ProductionKind" } }
    end
  end

  def show
    render json: { data: @production_kind }, status: :ok
  end

  def update
    if @production_kind.update(production_kind_params)
      render json: { data: @production_kind }, status: :ok
    else
      render json: { data: { error: "Can't update ProductionKind" } }
    end
  end

  def destroy
    @production_kind.destroy

    render json: { data: { message: "Deleted succesful" } }
  end

  def set_production_kind
    begin
      @production_kind = ProductionKind.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { data: { error: 'ProductionKind not found' } }, status: :not_found
    end
  end

  def production_kind_params
    params.permit(:name)
  end
end