require 'rails_helper'  

feature "Timeline" do
  before(:all) do
    @user ||= FactoryBot.create :user
  end
  before(:each) do
    visit "/posts"
    page.driver.post user_session_path, :user => {:email => @user.email, :password => @user.password}
    visit "/"
    find("a#postmessage").click
    fill_in "post[message]", with: "Hello, world!", :visible => false
    click_button "Submit"
  end

  scenario "Can submit posts and view them" do
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can post a message and see the date and time" do
    expect(page).to have_content("less than a minute ago")
  end
end
