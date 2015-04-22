class Api::InventoryItemsController < Api::BaseController
  
  def index
    render :json => inventory_items
  end

  def show
    render :json => inventory_item
  end

  def create
    InventoryItem.create(inventory_item_params)
    render :json => inventory_item
  end

  def update
    InventoryItem.update(inventory_item_params)
    render :json => inventory_item
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
