class ApplicationController < ActionController::Base
  protect_from_forgery

=begin
  rescue_from Stock::ArgumentError, :with => :argumentError
	private   def argumentError
		flash[:error] = "You must enter a valid Stock Ticker Symbol." redirect_to :index
	end
=end
end
