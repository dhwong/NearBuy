class ApplicationController < ActionController::Base
  helper_method :current_user
  include SessionsHelper

  def index
    render text: "", layout: "application"
  end


  private


    def authorize
      if current_user.nil?
        alert "Not authorized"
      end
    end

    #def correct_user
      #@user ||= User.find(params[:id])
    #end
end
