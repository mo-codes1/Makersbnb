require 'pg'

class Space 

  attr_reader :name, :available

  def initialize(name, available)
    @name = name
    @available = true
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect(dbname: "makersbnb")
    end
    result = connection.exec("SELECT * FROM spaces")
    p result
    result.map { |space| space }
  end

  def self.book(available:, name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect(dbname: "makersbnb")
    end
    result = connection.exec("UPDATE spaces SET (available = 'false') WHERE (name = 'Windsor Castle)")

  
  end

  end

  

