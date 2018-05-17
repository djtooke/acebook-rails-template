class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    puts user_signed_in?
    puts current_user.email
    puts user_session
  end  
end
