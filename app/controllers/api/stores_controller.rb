class Api::StoresController < Api::BaseController
  def index
    respond_with :api, stores
  end

  def show
    respond_with :api, store
  end

  def create
    respond_with :api, stores.create(store_params)
  end

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
    params.permit(:name, :store_type, :location, :owner_id)
  end
end
