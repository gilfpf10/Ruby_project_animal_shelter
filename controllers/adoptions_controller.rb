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

post "adoptions" do
  adoption = Adoption.new(params)
  adoption.save
  animal = Animal.find(adoption.animal_id)
  animal.get_adopted
  animal.update
  redirect to ("/adoptions")
end
