require 'pg'

class Space 

  attr_reader :id, :name, :available, :owner_name # 

  def initialize(id:, name:, available:, owner_name:) #
    @id = id
    @name = name
    @available = available
    @owner_name = owner_name
    #
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect(dbname: "makersbnb")
    end
    result = connection.exec("SELECT * FROM spaces")
    result.map { |space|  
    Space.new(id: space["id"], name: space["name"], available: space["available"], owner_name: space["owner_name"]) #
    }
  end


  def self.create(name:, owner_name:) #??
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect(dbname: "makersbnb")
    end
      result = connection.exec("INSERT INTO spaces (name, available) VALUES('#{name}', true) RETURNING id, name, available, owner_name;") 
      Space.new(id: result[0]['id'], name: result[0]['name'], available: result[0]['available'], owner_name: result[0]['owner_name'])
  end

  def self.book(name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect(dbname: "makersbnb")
    end
    result = connection.exec_params(
    "UPDATE spaces SET available = 'f' WHERE name = $1 RETURNING id, name, available, owner_name;",
    [name]
    ) 
    Space.new(id: result[0]['id'], name: result[0]['name'], available: result[0]['available'], owner_name: result[0]['owner_name'])
  end
end