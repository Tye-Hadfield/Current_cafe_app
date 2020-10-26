class MenuItemsController < ApplicationController

  before_action :set_item, only: [:show, :update, :edit, :destroy]


  def index
  @items = MenuItem.order(:id)

  end

  def show
  end

  def create
    item = MenuItem.create(menu_item_params)
    redirect_to menu_item_path(@item)
  end

  def new
    @item = MenuItem.new
  end

  def update
    item = MenuItem.find(params[:id])
    item.update(menu_item_params)
    redirect_to menu_item_path(item)
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to menu_items_path
  end

  private

  def set_item

    @item = MenuItem.find(params[:id])
    @menus = Menu.all


  end

  def menu_item_params
    params.require(:menu_item).permit(:item, :price, :quantity, menu_ids: [])
  end

end