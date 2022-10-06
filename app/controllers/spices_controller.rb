class SpicesController < ApplicationController
  def index
    render json: Spice.all, status: :ok
  end

  #   def show
  #     spice = Spice.find(params[:id])
  #     render json: spice, status: :ok
  #   end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice =  find_params
    spice.update(spice_params)
    render json: spice
  end


  def destroy
    spice = find_params
      spice.destroy
    head :no_content
  end

  private

  def find_params
    Spice.find_by(id: params[:id])
  end

  def spice_params
    params.permit(:notes, :image, :title, :description, :rating)
  end
end
