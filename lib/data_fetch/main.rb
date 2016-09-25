require 'json'
$file = File.read("#{Rails.root}/lib/"+'yelp_data.json') # Added eager_load in application config so $file will get load at boot time inturn get_restaurant method calling become faster

module DataFetch
	module Main
		class << self
			def get_restaurants
				begin
					yelp_data = JSON.parse($file) 
				rescue Exception => e
					Rails.logger.info e.message
				end

				return yelp_data["businesses"].sort {|a,b| b["review_count"]<=>a["review_count"]} # Sort hash array by review_count key in desc
			end
		end
	end
end