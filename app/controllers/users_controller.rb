class UsersController < ApplicationController
  def create
    user = User.new(permite_users_params)
    if user.save
      render json: {
        user: user.as_json,
        success: true
      } and return
    end
    render json: {
      user: user.as_json,
      success: false,
      errors: user.errors.full_messages.join(', ')
    }
  end

  def show
  end


  private
  def permite_users_params
    params.require(:user).permit(:name, :email)
  end
end
