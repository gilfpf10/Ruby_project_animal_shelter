require( 'pry-byebug' )
require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/animal")
require_relative("../models/owner")
require_relative("../models/adoption")
also_reload("./models/*")

get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end


get "/animals/ready" do
  @animals = Animal.ready()
  erb(:"animals/ready")
end


get "/animals/adopted" do
  @animals = Animal.adopted()
  erb(:"animals/adopted")
end

post "/animal/new" do
  new_animal = Animal.new(params)
  new_animal.save()
  redirect to(:"animals")
end

get '/animals/new' do
  @animals = Animal.all()
  erb(:"animals/new")
end

get "/animal/show" do
  @animals = Animal.all()
  erb(:"animals/index")
end

get "/animals/:id" do
  @animal = Animal.find(params["id"].to_i)
  erb(:"animals/show")
end

get "/animals/:id/edit" do
  @animal = Animal.find (params["id"].to_i)
  erb(:"animals/edit")
end

post "/animals/:id" do
  animal = Animal.find(params["id"])
  animal.update
  redirect to "/animals/#{params["id"]}"
end
