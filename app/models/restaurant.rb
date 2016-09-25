require 'data_fetch/main.rb'

class Restaurant < ActiveRecord::Base
	attr_accessor  :business
	serialize  :business 

	class << self
		def all #Overridden Active record method
			
	    	Rails.logger.info "Run my custom Restaurant.all"
	    	restaurants = Rails.cache.fetch("businesses") { DataFetch::Main.get_restaurants}
	    	map_restaurants(restaurants)
	  end

	  def initialize(restaurant)
		@business = {

			restaurant_name: restaurant["name"], 
			review_count: restaurant["review_count"],

			address: {

							latitude: restaurant["latitude"], longitude: restaurant["longitude"], city: restaurant["city"],

							state: restaurant["state"],	zipcode: restaurant["zip"]

						},

			rating: restaurant["avg_rating"]
		}
		@business
	end

	def map_restaurants(restaurants)
		restaurants_list = restaurants.map do |restaurant|
			Restaurant.initialize(restaurant)
		end
	end
  end
end
