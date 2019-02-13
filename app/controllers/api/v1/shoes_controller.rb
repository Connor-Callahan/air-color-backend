class Api::V1::ShoesController < ApplicationController
  before_action :find_shoe, only: [:show, :edit, :update, :destroy]

  def index
    @shoes = Shoe.all
    render json: @shoes
  end

  def show
    render json: @shoe
  end

  def create
    @shoe = Shoe.create(shoe_params)
    if @shoe.save
      render json: @shoe, status: :accepted
    else
      render json: { errors: @shoe.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    if @shoe.update(shoe_params)
      render json: @shoe, status: :accepted
    else
      render json: { errors: @shoe.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @shoe.destroy
  end

  private

  def shoe_params
    params.permit(:name, :title, :likes, :img_url)
  end

  def find_shoe
    @shoe = Shoe.find(params[:id])
  end

end
