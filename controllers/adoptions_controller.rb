require( 'pry-byebug' )
require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/animal")
require_relative("../models/owner")
require_relative("../models/adoption")
also_reload("./models/*")

get '/adoptions' do
  @adoptions = Adoption.all()
  erb(:"adoptions/index")
end

get '/adoptions/new' do
  @owners = Owner.all
  @animals = Animal.all
  erb(:"adoptions/new")
end


post "/adoptions" do
  new_adoption = Adoption.new(params)
  new_adoption.save()
  redirect to(:"//adoptions")
end


post "/adoptions/:id/delete" do
  Adoption.delete(params[:id])
  redirect to(:"/adoptions")
end
