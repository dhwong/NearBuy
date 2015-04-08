class Api::InventoryItemsController < Api::BaseController
  def index
    respond_with :api, inventory_items
  end

  def show
    respond_with :api, inventory_item
  end

  def create
    respond_with :api, inventory_items.create(inventory_item_params)
  end

  def destroy
    respond_with :api, inventory_item.destroy
  end

  private

  def inventory_items
    @inventory_items ||= InventoryItem.all
  end

  def inventory_item
    @inventory_item ||= inventory_items.find(params[:id])
  end

  def inventory_item_params
    params.permit(:name, :category, :brand)
  end
end
