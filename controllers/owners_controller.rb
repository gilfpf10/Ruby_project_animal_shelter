require( 'pry-byebug' )
require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/animal")
require_relative("../models/owner")
require_relative("../models/adoption")
also_reload("./models/*")


get '/owners' do
  @owners = Owner.all()
  erb(:"owners/index")
end

get "owners/:id" do
  @owners = Owner.find(params["id"].to_i)
  erb(:"owners/show")
end

post "/owner/new" do
  new_owner = Owner.new(params)
  new_owner.save()
  redirect to "/owners"
end

get "/owner/new" do
  @owner = Owner.all
  erb(:"owners/new")
end
