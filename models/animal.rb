require_relative('../db/sql_runner')

class Animal

  attr_reader( :name, :admission, :age, :availability, :type, :id)

  def initialize(options)
    @id = options["id"].to_i if options['id']
    @name = options ["name"]
    @admission = options ["admission"].to_i
    @age = options ["age"].to_i
    @availability = options ["availability"].to_i
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


end
