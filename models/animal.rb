require_relative('../db/sql_runner')

class Animal

  attr_reader(:admission, :age, :type, :id)
  attr_accessor(:name, :availability)

  def initialize(options)
    @id = options["id"].to_i if options['id']
    @name = options ["name"]
    @admission = options ["admission"]
    @age = options ["age"].to_i
    @availability = options ["availability"]
    @type = options ["type"]
  end

  def save()

    sql = "INSERT INTO animals
    (
      name,
      admission,
      age,
      availability,
      type
    )
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING *"
    values = [@name, @admission, @age, @availability, @type]
    results = SqlRunner.run(sql, values)
    @id = results.first() ["id"].to_i
  end


  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run(sql)
    return results.map {|animals| Animal.new(animals)}
  end


  def update()
    sql = "UPDATE animals SET (
    name,
    admission,
    age,
    availability,
    type
    )=
    ($1, $2, $3, $4, $5)
    WHERE id =$6"
    values = [@name, @admission, @age, @availability,@type, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run(sql)
    return results.map {|hash| Animal.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run (sql)
  end

  def delete()
    sql = "DELETE from animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM animals WHERE id = $1"
    values =[id]
    results = SqlRunner.run(sql, values)
    return Animal.new(results.first)
  end

  def self.ready()
    sql = "SELECT * FROM animals
    WHERE availability = 'ready'"
    results = SqlRunner.run(sql)
    return results.map {|hash| Animal.new(hash)}
  end

  def self.adopted()
    sql = "SELECT * FROM animals
    WHERE availability = 'adopted'"
    results = SqlRunner.run(sql)
    return results.map {|hash| Animal.new(hash)}
  end


end
