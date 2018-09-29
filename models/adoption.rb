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
    @id = results.first()['id'].to_i
  end





end
