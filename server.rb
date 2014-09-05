require 'sinatra'
require 'sinatra/json'
require 'pry-byebug'

require_relative 'lib/transliterator.rb'

set :bind, '0.0.0.0'

enable :sessions

configure do
  stored = Transliterator::ColorHash.new
  # binding.pry
  @@random = stored.random
  @@colors = stored.colors
  @@midnight = stored.midnight
  @@spring = stored.spring
end

get '/' do
    @uncolored_text = []
    @colors = @@colors
    erb :painter, layout: :paint_control
end

# get '/signup' do
#   erb :signup
# end

# post '/signup' do
#   p params
#   result = Transliterator::SignUp.run(params)


#   if result[:success?]
#     session[:username] = result[:username]
#     redirect to '/'
#   else
#     redirect to '/login'
#   end
# end

# get '/login' do
#   erb :login
# end

# post '/login' do
#   result = Transliterator::SignIn.run(params)

#   if result[:success?]
#     session[:username] = result[:username]
#     redirect to '/'
#   else
#     redirect to '/signup'
#   end

# end



# post '/signout' do
#   session.clear
#   redirect '/login'
# end

get '/paint' do
  @uncolored_text = []
  @colors = @@colors
  erb :painter, layout: :paint_control

end

post '/paint' do
  @original_text = params[:uncolored_text]
  @uncolored_text = params[:uncolored_text].gsub(/\s/,"").split(//)
  case params[:palettes]
    when 'original' then @colors = @@colors
    when 'midnight' then @colors = @@midnight
    when 'spring' then @colors = @@spring
    when 'random' then @colors = Transliterator::Randomizer.run
  end
  @shape = params[:shape]
  @size = params[:size]
  @magical = params[:magical]
  erb :painter, layout: :paint_control
end

# get "/something" do
#   erb :signup
# end

# get "/api/translated_js" do
#   json @@colors
# end





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
