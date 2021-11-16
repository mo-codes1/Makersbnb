require 'space'
require 'pg'

describe Space do 
  describe '.all' do 
    it 'it should retun a list of spaces from the database' do
      conn = PG.connect(dbname: 'makersbnb_test')
      spaces = Space.all 
      expect(spaces).to include('Windsor Castle')
      expect(spaces).to include('Roka Rooms')
    end
  end
end
