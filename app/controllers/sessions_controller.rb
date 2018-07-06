class SessionsController < ApplicationController

  def new
  end

  def create

    user = findEmail

    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def findEmail
    if params[:session][:email]
      user = User.find_by(email: params[:session][:email].downcase)
    else
      user = nil
    end
  end


end
