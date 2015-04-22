class Api::StoresController < Api::BaseController

  def index
    render :json => stores
  end

  def show
    render :json => store
  end

  def create
    Store.create(store_params)
    render :json => store
  end

  def update
    Store.update(store_params)
    render :json => store
  end

  def destroy
    store.destroy
    render :json => { :response => "Store deleted" }
  end

  private

    def stores
      @stores ||= Store.all
    end

    def store
      @store ||= stores.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:name, :store_type, :location, :owner_id)
    end
    
end
