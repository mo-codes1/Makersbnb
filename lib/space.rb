require 'pg'

class Space 

  attr_reader :id, :name, :available

  def initialize(id:, name:, available:)
    @id = id
    @name = name
    @available = available
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect(dbname: "makersbnb")
    end
    result = connection.exec("SELECT * FROM spaces")
    result.map { |space| } #update the rest of the app
    Space.new(id: space["id"], name: space["name"], available: space["available"])

  end


  def self.create(name:) # add function: set available to true by default
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect(dbname: "makersbnb")
    end
      connection.exec("INSERT INTO spaces (name, available) VALUES('#{name}', true) RETURNING id, name, available") 
  end
end