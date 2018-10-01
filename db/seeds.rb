require_relative( "../models/adoption.rb" )
require_relative( "../models/animal.rb" )
require_relative( "../models/owner.rb" )
require("pry-byebug")

Adoption.delete_all()
Animal.delete_all()
Owner.delete_all()

animal1 = Animal.new({
  "name" => "Kika",
  "admission" => '2018-01-01',
  "age" => 2,
  "availability" => "adopted",
  "type" => "cat"
})
animal1.save()

animal2= Animal.new({
  "name" => "Mitch",
  "admission" => '01-01-2018',
  "age" => 4,
  "availability" => "trainning",
  "type" => "dog"
  })
animal2.save()


owner1= Owner.new({
"name" => "Bob"
})
owner1.save()

adoption1 = Adoption.new({
  "animal_id" => animal1.id,
  "owner_id" => owner1.id
  })
adoption1.save()


binding.pry
nil
