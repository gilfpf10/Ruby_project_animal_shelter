require_relative('../db/sql_runner')

class Animal

  attr_reader(:admission, :age, :type, :id)
  attr_accessor(:name, :availability)

  def initialize(options)
    @id = options["id"].to_i if options['id']
    @name = options ["name"]
    @admission = options ["admission"].to_i
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
    return results.map {|hash| Animals.new(hash)}
  end

  def update()
    sql = "UPDATE animals SET (
    name,
    admission,
    age,
    availability,
    type
    )= $1, $2, $3, $4)
    WHERE id =$5"
    values = [@name, @admission, @age, @availability,@type, @id]
    SqlRunner.run(sql, values)
  end

  def delete_all()
    sql = "DELETE * FROM animals"
    SqlRunner.run (sql)
  end

end
