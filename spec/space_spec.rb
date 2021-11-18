require 'space'
require 'pg'

describe Space do 
  describe '.all' do 
    it 'it should retun a list of spaces from the database' do
      connection = PG.connect(dbname: 'makersbnb_test')
      spaces = Space.all 
      expect(spaces).to include("Windsor Castle")
      expect(spaces).to include("Roka Rooms")
    end
  end

  describe '.book' do
    it 'should set availability of spaces to false' do
      connection = PG.connect(dbname: 'makersbnb_test')
      space = Space.book(name: 'Windsor Castle') # here we are trying to access which booking button was clicked
      spaces = Space.all
      expect(spaces).to include # Windsor Castle available: false) #sudo code)
    end    
  end
end


