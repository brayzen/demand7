require "test_helper"

feature 'New user, new email confirmation' do
  scenario 'new user has signed up, get email confirmation' do
    #user creates a new account
    visit new_user_registration_path
    fill_in "Name", with: 'brizzle'
    fill_in "Email", with: 'brizzle@example.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button 'Sign up'

    # UserMailer.deliveries.must_include("brizzle@example.com")
    UserMailer.deliveries.last.to.first.must_equal 'brizzle@example.com'
  end

  scenario 'stub email' do
    email = UserMailer.welcome_email(users(:jane))
    email.must deliver_to "user2@example.com"
    email.must have_subject "Welcome to IgniteBot!"
    email.must deliver_from "bray21345@gmail.com"
  end
end
