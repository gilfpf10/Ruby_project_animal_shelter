require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative("controllers/adoptions_controller")
require_relative("controllers/animals_controler")
require_relative("controllers/owners_controller")

get '/' do
  erb( :index )
end
