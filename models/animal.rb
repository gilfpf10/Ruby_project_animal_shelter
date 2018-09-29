require_relative('../db/sql_runner')

class Animal

  attr_reader( :name, :admission_date, :age, :availability, :type, :id)

  def initialize(options)
    @id = options["id"].to_i if options['id']
    @name = options ["name"]
    @admission_date = options ["admission_date"].to_i
    @age = options ["age"].to_i
    @availability = options ["availability"]
    @type = options ["type"]

    def save()

      sql = "INSERT INTO animals
      (
        name,
        admission_date,
        age,
        availability,
        type
        )
        VALUES
        ($1, $2, $3, $4, $5)
        RETURNING *"
        values = [@name, @admission_date, @age, @availability, @type]
        results = Sqlrunner.run(sql, values)
        @id = results_data.first() ["id"].to_i
      end







end
