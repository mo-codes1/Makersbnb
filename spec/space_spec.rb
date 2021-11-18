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

  describe '#book' do
    
    it 'should set availability of spaces to false' do
      pending
      conn = PG.connect(dbname: 'makersbnb_test')
      spaces = Space.update
      expect('Windsor Castle').to updated_with(false) # this is sudo code
    end    
  end
  
  describe '.create' do 
    it 'creates a new space' do
    space = Space.create(name: 'The Hilton').first #what does .first do here?
    expect(space['name']).to eq 'The Hilton'
    end
  end 

end
