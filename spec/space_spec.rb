require 'space'
require 'pg'

describe Space do 
  describe '.all' do 
    it 'it should return a list of spaces from the database' do
      conn = PG.connect(dbname: 'makersbnb_test')
      space = Space.create(name: 'Tudor Room')
      spaces = Space.all 
      expect(spaces.length).to eq 1
      expect(spaces.first).to be_a Space
      expect(spaces.first.id).to eq space.id
      expect(spaces.first.name).to eq 'Tudor Room'
      expect(spaces.first.available).to eq 't'
     
    end
  end

  describe '.book' do
    it 'books a space' do
      space = Space.create(name: 'The Hilton')
      updated_space = Space.book(name: space.name)
      
      expect(updated_space).to be_a Space
      expect(updated_space.id).to eq space.id
      expect(updated_space.name).to eq 'The Hilton'
      expect(updated_space.available).to eq 'f'
    end    
  end
  
  describe '.create' do 
    it 'creates a new space' do
    space = Space.create(name: 'The Hilton')
    persisted_data = PG.connect(dbname: 'makersbnb_test').query("SELECT * FROM spaces WHERE id = #{space.id};")
    expect(space.name).to eq 'The Hilton'
    expect(space.available).to eq 't'
    end
  end


end
