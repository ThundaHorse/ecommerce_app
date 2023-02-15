# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def create
    @item = Item.new(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )

    if @item.save
      render json: @item
    else
      render json: { message: @item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      render json: @item
    else
      render json: { message: @item.errors.full_messages }
    end
  end

  def delete
    @item = Item.find(params[:id])
    @item.delete
    render json: { message: 'Deleted successfully' }
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end
end
