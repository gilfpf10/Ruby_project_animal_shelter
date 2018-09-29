require_relative('../db/sql_runner')


class Owner

  attr_reader( :name, :id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options["name"]
  end

  def save ()

    sql = "INSERT INTO owners
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
 end






end
