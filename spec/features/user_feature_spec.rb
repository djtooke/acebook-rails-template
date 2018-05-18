require 'rails_helper'  
feature "User" do
  before(:all) do
    @user ||= FactoryBot.create :user
  end
  feature "Timeline" do
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
  
  feature "Security" do
    scenario "Can sign out of Acebook" do
      visit "/posts"
      page.driver.post user_session_path, :user => {:email => @user.email, :password => @user.password}
      visit "/"
      find("a#signout").click
      visit "/"
      expect(page).to have_current_path(new_user_session_url)
    end  
  end
  feature "Customize" do
    scenario "Can edit my profile" do
      visit "/posts"
      page.driver.post user_session_path, :user => {:email => @user.email, :password => @user.password}
      visit edit_user_registration_path
      fill_in "user[password]", with: "newpassword"
      fill_in "user[password_confirmation]", with: "newpassword"
      fill_in "user[current_password]", with: @user.password
      click_button "Update"
      expect(page).to have_current_path(new_user_session_url)
    end
  end
end

