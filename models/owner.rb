require_relative('../db/sql_runner')


class Owner

  attr_reader( :name, :id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options["name"]
  end

  def save()

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

def self.find

  sql = "SELECT * FROM owners"
  results = SqlRunner.run(sql)
  return results.map {|hash| Animals.new(hash)}

end

def update()
  sql = "UPDATE owners SET (
  name
  ) = ($1)
  WHERE id = $2"
  values = [@name, @id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM owners"
  SqlRunner.run (sql)
end


end
