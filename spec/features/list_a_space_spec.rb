feature 'List a space' do
  scenario 'I would like to be able to list a space and name' do
    visit('/add_rooms')
    fill_in('space', :with => "room1")
    click_button 'submit'
    expect(page).to have_content "room1"
    