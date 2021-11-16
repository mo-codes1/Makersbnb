feature 'viewing a room' do
  scenario 'user will be able to view a room on the site' do
    visit '/spaces'
    expect(page).to have_content('Room 1')
  end
end