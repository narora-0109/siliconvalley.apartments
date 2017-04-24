class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user=User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      if user.email_confirmed
        session[:name] = user.name
        session[:id] = user.id
        redirect_to '/users'
      else
        redirect_to root_url, :notice => 'Please activate your account by following the
        instructions in the account confirmation email you received to proceed'
      end
    else
        redirect_to root_url, :notice => 'name or password is not valid!'
    end
  end

  def destroy
    session[:name]=nil
    redirect_to root_url
  end

  def show
    if session[:name]!=nil
      redirect_to '/users'
    end
  end

end