class Api::SearchController < Api::BaseController

# SEARCH LOGGING WILL BE HANDLED IN THIS CONTROLLER


	def search

		_search = Item.search do
			fulltext params[:search][:query]
			#fulltext("keywords", :fields => :search, :location)
		end

		_results = []

		#[ 	{ 	:name => item.name,
		#		:stores => []
		#	},
		#	{ 	:name => item.name,
		#		:stores => [ {  :name => store.name,
		#						:location => store.location },
		#					 {  :name => store.name,
		#					  	:location => store.location } ]
		#	}
		#]

		for result in _search.results do
			entry = {}
			entry[:name] = result.name
			store_list = []
			for store in result.stores
				store_list << store
			end
			entry[:stores] = []
			for store in store_list do
				entry[:stores] << { :name => store.name, :location => store.location }
			end
			_results << entry
		end

		render :json => { :response => _results }
		#_response = _search.results

		#^^^^^^^^^^^^^^^^
		#_current_location = params[:location]

		#_store_data = []

		#_search.results.each do |item|
			#_store_location = item[:store][:location]
			#_store_distance = geodistance.(_current_location, _store_location)
			#_store_name = item[:store].name



		#end

		#-----OR-------

		#_search.order_by_geodist(:location, _current_location)

		#order_by_geodist(:location, *Geocoder.coordinates(params[:loc]))

		#^^^^^^^^^^^^^^^

		# this needs a lot of work
		#_response = {
			#:results => {
				#:item => _item,
				#:store => { :name => _store_name, 
							#:distance => store_distance }
			#}
		#}

		#render :json => { :response => _response }
	end



end