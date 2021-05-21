require 'rails_helper'

RSpec.feature "Timeline", type: :feature do 
  scenario "Posts are posted in reverse chronological order" do
    visit "/posts"
    visit '/login'
    fill_in 'Email', with: 'bobross@mail.com'
    fill_in 'Password', with: 'password123'
    click_button 'Login'
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Submit' 
    fill_in 'post[message]', with: "Hello, wurld!"
    click_button 'Submit'  
    expect("Hello, wurld!").to appear_before("Hello, world!")
  end
end