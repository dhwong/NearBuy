class Api::SessionsController < Api::BaseController

	def new
	end

	def create
		user = User.find_by(:email => params[:sessions][:email].downcase)
		if user && user.authenticate(params[:sessions][:password])
			user.api_keys.create!
			session[:user_id] = user.id
			render :json => { :success => true }
		else
			flash.now.alert = "Email or password is invalid"
			render :json => { :success => false }
		end
	end

	def destroy
		session[:user_id] = nil
		render :json => { :response => "Logged out" }
	end

end