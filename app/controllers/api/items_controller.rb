class Api::ItemsController < Api::BaseController
  def index
    # this needs added functionality
    @search = Item.search do
      fulltext params[:search]
    end
    @items = @search.results
    respond_with :api, @items.include(:store)
  end

  def show
    respond_with :api, item
  end

  def create
    respond_with :api, Item.create(item_params)
  end

  def update
    respond_with :api, Item.update(item_params)
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
      params.require(:item).permit(:name, :category, :brand)
    end
end
