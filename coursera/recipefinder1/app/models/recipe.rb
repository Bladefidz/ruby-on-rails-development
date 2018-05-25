# ENV["FOOD2FORK_KEY"] = "62f22f0e574df8dc52f358da6b5cb04f"
# ENV["FOOD2FORK_SERVER_AND_PORT"] = "food2fork.com:80"

class Recipe
	include HTTParty

	key_value = ENV["FOOD2FORK_KEY"]
	hostport = ENV["FOOD2FORK_SERVER_AND_PORT"] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"
	default_params key: ENV['FOOD2FORK_KEY']
	format :json

	def self.for keyword
		get("/search", query: { q: keyword })
	end
end