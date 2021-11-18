require 'pg'

class Space 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect(dbname: "makersbnb")
    end
    result = connection.exec("SELECT * FROM spaces")
    result.map { |space| space["name"] }

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