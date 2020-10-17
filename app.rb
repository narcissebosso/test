require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "scrape_marmiton_service"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

require_relative "cookbook"
require_relative "recipe"

get '/' do
  cookbook = Cookbook.new(File.join(__dir__, 'recipes.csv'))
  @recipes = cookbook.all
  @usernames = [ 'ssaunier', 'Papillard' ]
  erb :index
end


get '/about' do
  erb :about
end

get '/new' do
  erb :new_recipe
end

post '/new_recipe' do
  erb :new_recipe
end

get '/team/:username' do
  binding.pry
  # puts params[:username]
  # "The username is #{params[:username]}"
end


post '/recipes' do
  cookbook = Cookbook.new(File.join(__dir__, 'recipes.csv'))
  recipe = Recipe.new(params[:name], params[:description])
  cookbook.add(recipe)
  redirect to '/'
end

get '/recipes/:index' do
  cookbook = Cookbook.new(File.join(__dir__, 'recipes.csv'))
  cookbook.remove_at(params[:index].to_i)
  redirect to '/'
end
