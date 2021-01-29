# frozen_string_literal: true

class SessionsController < ApplicationController
  layout "auth"
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    @user = User.where(email: user_params[:email]).first
    if @user&.authenticate(user_params[:password])
      set_current_user(@user, user_params[:remember_me])
      redirect_to root_path, notice: "Login OK"
    else
      flash.now[:error] = "Email or password is wrong"
      render "new"
    end
  end

  def destroy
    cookies[:remember_token] = {
      value: nil
    }
    redirect_to root_path
 end

  def user_params
    params.require(:user).permit(:email, :password, :remember_me)
  end
end