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


    def self.all()

      sql = "SELECT * FROM owners"
      results = SqlRunner.run(sql)
      return results.map {|owners| Owner.new(owners)}

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

    def self.destroy(id)
      sql = "DELETE FROM owners WHERE id = $1"
      values = [id]
      SqlRunner.run( sql, values )
    end

    def self.find(id)
      sql = "SELECT FROM owner WHERE id = $1"
      values =[id]
      results = SqlRunner.run(sql, values)
      return Owner.new(results.first)

    end
  end
