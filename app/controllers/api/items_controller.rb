class Api::ItemsController < Api::BaseController

  def index
    render :json => items
  end

  def show
    render :json => item
  end

  def create
    Item.create(item_params)
    render :json => item
  end

  def update
    Item.update(item_params)
    render :json => item
  end

  def destroy
    item.destroy
    render :json => { "Item deleted" }
  end

  private

    def items
      @items ||= Item.all
    end

    def item
      @item ||= items.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :category, :brand)
    end
    
end
