class Api::ItemsController < Api::BaseController
  def index
    respond_with :api, items
  end

  def show
    respond_with :api, item
  end

  def create
    respond_with :api, items.create(item_params)
  end

  def destroy
    respond_with :api, item.destroy
  end

  private

  def items
    @items ||= Item.all
  end

  def item
    @item ||= items.find(params[:id])
  end

  def item_params
    params.permit(:name, :category, :brand)
  end
end
