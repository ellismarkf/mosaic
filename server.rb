require 'sinatra'
require 'sinatra/json'
require 'pry-byebug'

require_relative 'lib/transliterator.rb'

set :bind, '0.0.0.0'

configure do
  stored = Transliterator::ColorHash.new
  # binding.pry
  @@colors = stored.colors
  @@midnight = stored.midnight
  @@spring = stored.spring
end

get '/' do
  erb :painter
end

# get '/translated' do
#   @uncolored_text = []
#   @colors = @@colors
#   erb :painter
# end

# post '/translated' do
#   @uncolored_text = params[:uncolored_text].gsub(/\s/,"").split(//)
#   @colors = @@colors
#   erb :painter
# end

get '/paint' do
  @uncolored_text = []
  @colors = @@colors
  erb :painter, layout: :paint_control

end

post '/paint' do
  puts params
  @original_text = params[:uncolored_text]
  @uncolored_text = params[:uncolored_text].gsub(/\s/,"").split(//)
  case params[:palettes]
    when 'random' then @colors = @@colors
    when 'midnight' then @colors = @@midnight
    when 'spring' then @colors = @@spring
  end
  erb :painter, layout: :paint_control
end

# get "/something" do
#   erb :signup
# end

# get "/api/translated_js" do
#   json @@colors
# end