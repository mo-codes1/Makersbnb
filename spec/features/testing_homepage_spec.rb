require './spec/web_helpers'

feature 'testing homepage' do
  scenario 'expecting homepage to have content' do 
    enter
    expect(page).to have_content('Welcome to our BnB!')
  end
end