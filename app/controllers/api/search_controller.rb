class Api::SearchController < Api::BaseController

# SEARCH LOGGING WILL BE HANDLED IN THIS CONTROLLER?


	def search

		# _current_user = Sessions.current_user

		# if @current_user.has_location?
			# @current_user.latitude, @current_user.longitude
			# lat = @current_user.latitude
			# lon = @current_user.longitude

		# for IP address
			# loc = request.location

		
		lat = params[:search][:latitude]
		lon = params[:search][:longitude]
		@stores_near = Store.near([lat, lon], 250)
		#@stores_near = Store.near(params[:search][:location], 15, :order => distance)
		# @stores_near = Store.near([lat, lon], params[:search][:radius])
		# @stores_near = Store.near([lat, lon], :radius)
		# @stores_near = Store.in_radius(loc, 15, :order => distance) << if loc is address
		if @stores_near.nil?
			@stores_near = Store.all
		end


		_search = Item.search do
			fulltext params[:search][:query]

			# Best way to include Geocoder distance for stores?
				#_search.order_by_geodist(:location, _current_location)
				#order_by_geodist(:location, *Geocoder.coordinates(params[:loc]))
				#with(:location).in_radius(10, @current_location)

			# Best way to pass current_user's location?
				#_current_location = params[:location]


		end

		_results = []

		# => FORMAT OF RESPONSE (will need to change to order by distance)
		#[ 	{ 	:name => item.name,
		#		:stores => []
		#	},
		#	{ 	:name => item.name,
		#		:stores => [ {  :name => store.name,
		#						:distance => store.distance },
		#					 {  :name => store.name,
		#					  	:distance => store.distance } ]
		#	}
		#]

		for result in _search.results do
			_entry = {}
			_entry[:name] = result.name
			store_list = []
			for _store in result.stores
				store_list << _store
			end
			_entry[:stores] = []
			for _store in @stores_near do
				if store_list.include? _store
					_distance = _store.distance_from([lat,lon])
					_entry[:stores] << { :name => _store.name, :address => _store.address,
										:distance => _distance }
										# :distance => store.distance
										# distance = store.distance_from([lat, lon])
										# direction = store.bearing_to(:location)
				end
			end
			_results << _entry
		end

		render :json => { :response => _results }

	end

end