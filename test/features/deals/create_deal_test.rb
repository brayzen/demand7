require 'test_helper'

feature 'Create A Deal' do
  scenario 'logged in user can create a deal' do
    sign_in
    visit deals_path
    click_on "New Deal"
    fill_in "Title", with: deals(:widgets).title
    fill_in "Image", with: deals(:widgets).image
    fill_in "Description", with: deals(:widgets).description
    fill_in "Goal", with: deals(:widgets).goal
    fill_in "Location", with: deals(:widgets).location
    fill_in "Amount", with: deals(:widgets).amount
    click_on "Create Deal"
    page.text.must_include "Deal was successfully created"
    save_and_open_page
    page.text.must_include "Widgets"
  end

  scenario 'visitor must log in to create a deal' do
    visit deals_path
    click_on "New Deal"
    page.text.must_include "You need to sign in or sign up before continuing."
  end
end
