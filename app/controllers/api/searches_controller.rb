class Api::SearchesController < Api::BaseController

	def show
		#@search = search(params[:q])
		#@results = @search.results

		_search = Sunspot.search Item do
			fulltext params[:query]
			#fulltext("keywords", :fields => :search, :location)


		end

		#^^^^^^^^^^^^^^^^
		_current_location = params[:location]

		_store_data = []

		_search.results.each do |item|
			_store_location = item[:store][:location]
			_store_distance = geodistance.(_current_location, _store_location)
			_store_name = item[:store].name



		end

		#-----OR-------

		_search.order_by_geodist(:location, _current_location)

		#order_by_geodist(:location, *Geocoder.coordinates(params[:loc]))

		#^^^^^^^^^^^^^^^

		# this needs a lot of work
		_response = {
			:results => {
				:item => _item,
				:store => { :name => _store_name, 
							:distance => store_distance }
			}
		}

		respond_with _response
	end



end