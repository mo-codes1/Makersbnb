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

end