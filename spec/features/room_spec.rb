feature 'viewing a room' do
  scenario 'user will be able to view a room on the site' do
    space = Space.create(name: "Windsor Castle", owner_name: "Jeff", price: "100", description: "Spacious")
    visit '/spaces'
    expect(page).to have_content('Windsor Castle') 
  end
end