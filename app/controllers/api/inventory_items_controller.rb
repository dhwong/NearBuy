class Api::InventoryItemsController < Api::BaseController
  def index
    respond_with :api, inventory_items
  end

  def show
    respond_with :api, inventory_item
  end

  def create
    respond_with :api, InventoryItem.create(inventory_item_params)
  end

  def update
    respond_with :api, InventoryItem.update(inventory_item_params)
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
      params.require(:inventory_item).permit(:store_id, :item_id, :price_in_cents, :in_stock)
    end
end
