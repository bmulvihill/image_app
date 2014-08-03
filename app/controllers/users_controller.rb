class UsersController < ApplicationController

	def show
	  @user = User.find(params[:id].to_s)
	end

  def edit
  end
end
