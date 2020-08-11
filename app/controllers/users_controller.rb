class UsersController < ApplicationController
  def show
    @user = User.find(params['id'])
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts @user
    @user_events = Event.where(admin_id: @user.id)
  end

end
