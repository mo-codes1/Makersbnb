feature 'testing homepage' do
  scenario 'expecting homepage to have content' do 
    visit('/')
    expect(page).to have_content('Welcome to BnB!')
  end
end