require 'sass'
require 'sinatra'
require 'sinatra/reloader' if development?

require "metar"

# configure do
# 	enable :sessions
# end

get('/styles.css'){ scss :styles }

get '/' do 
	erb :index
end

post '/' do
	station = params[:station]

	if station == "" or station.length != 4
		@error = "Please enter a four letter identifier."
	else
		station.upcase!
		s = Metar::Station.find_by_cccc(station)
		@raw = s.parser.raw
		@parsed = s.report.to_s
	end

	erb :index
end

get '/about' do 
	@title = "All About This Website" 
	erb :about
end

not_found do 
	erb :not_found
end


