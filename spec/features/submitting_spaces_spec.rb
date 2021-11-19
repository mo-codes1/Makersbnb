feature 'Inputting a space' do
  scenario 'Creating spaces' do
    visit('/add_space')
    fill_in('space_name', :with => "room1")
    click_button 'submit'
    expect(page).to have_content "room1"
  end
end