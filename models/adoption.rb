require_relative('../db/sql_runner')

class Adoption

  attr_reader(:owner_id, :animal_id, :id)

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @owner_id = options["owner_id"].to_i
    @animal_id = options["animal_id"].to_i
  end

  def save()

    sql = "INSERT INTO adoptions
    (
      owner_id,
      animal_id
    )
    VALUES
    ($1, $2)
    RETURNING id"

    values = [@owner_id, @animal_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run( sql )
    return results.map { |adoptions| Adoption.new(adoptions) }
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run( sql )
  end

  def owner()
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [@owner_id]
    results = SqlRunner.run( sql, values)
    return Owner.new( results.first )
  end

  def animal()
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [@animal_id]
    results = SqlRunner.run(sql, values)
    return Animal.new(results.first)
  end

  def self.find(id)
    sql = "SELECT * FROM adoptions WHERE id = $1"
    values =[id]
    results = SqlRunner.run(sql, values)
    return Adoption.new(results.first)
  end




end
