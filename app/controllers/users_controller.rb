class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: t('succ_created_acc')
    else
      redirect_to users_new_path
    end
  end

  private

  def user_params
    params.require(:user).permit(%i[email encrypted_password])
  end
end
