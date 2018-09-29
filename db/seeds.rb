require_relative( "../models/adoption.rb" )
require_relative( "../models/animal.rb" )
require_relative( "../models/owner.rb" )
require("pry-byebug")



animal1 = Animal.new({
  "name" => "Kika",
  "admission" => "2016-01-21",
  "age" => 2,
  "availability" => "available",
  "type" => "cat"
})
animal1.save()

animal2= Animal.new({
  "name" => "Mitch",
  "admission" => "2016-01-21",
  "age" => 4,
  "availability" => "available",
  "type" => "dog"
  })
animal2.save()


owner1= Owner.new({
"name" => "Bob"
})
owner1.save()


binding.pry
nil
