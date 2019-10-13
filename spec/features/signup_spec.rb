feature 'Signup' do
  scenario 'create a new user account' do
    visit('/signup')
    expect(page).to have_content "Join Chitter"

    fill_in 'username', with: 'TestUser'
    fill_in 'email', with: 'testing@email.test'
    fill_in 'password', with: 'TestPassword'
    fill_in 'password_check', with: 'TestPassword'
    click_button 'Submit'
    
    expect(page).to have_content "Welcome TestUser"
  end
end