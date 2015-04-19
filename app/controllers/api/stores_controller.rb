class Api::StoresController < Api::BaseController
  def index
    # this needs added functionality
    respond_with :api, stores
  end

  def show
    respond_with :api, store
  end

  def create
    respond_with :api, Store.create(store_params)
  end

  def update
    respond_with :api, Store.update(store_params)

  def destroy
    respond_with :api, store.destroy
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
