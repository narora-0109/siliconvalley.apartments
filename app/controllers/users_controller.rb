class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:create]
  before_action :authorize, only:[:index]

  def index
    #@listings = Listing.where(:user_id => session[:id])
    @listings = Listing.joins(:pictures).where(:user_id => session[:id]).where("pictures.listing_id = listings.id")
  end

  def show
  end

  def edit
    # show form for new password
  end

  def update
    # save new password
    @user=User.find_by(id: session[:id])
    if BCrypt::Password.new(@user.password_digest).is_password?(params[:current_password])
      if params[:new_password].empty?
        @message = "new password cannot be empty"
      elsif @user.update(password_digest: BCrypt::Password.create(params[:new_password],:cost => 10))
        @message = "done"
      else
        @message = "error updating password"
      end
    else
      @message = "wrong password specified"
    end
  end


  def new
    @user = User.new
  end

  def create
    @checkEmail = User.where(:email => allowed_params[:email])
    @checkUser = User.where(:name => allowed_params[:name])
    if !@checkEmail.empty? || !@checkUser.empty?
      redirect_to root_url, :notice => "user with email address or user name already exists"
    else
      @user = User.new(allowed_params)
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        #@user.error.messages.push("Please verify your email address to continue")
        redirect_to root_url, :notice => "Please verify your email address to continue"
      else
        redirect_to root_url
      end
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      #@user.error.messages.push("Welcome to the ApartmentFinder! Your email has been confirmed. Please sign in to continue.")
      redirect_to root_url, :notice => "Welcome to the ApartmentFinder! Your email has been confirmed. Please sign in to continue."
    else
      #@user.error.messages.push("Sorry. User does not exist")
      redirect_to root_url, :notice => "Sorry, user does not exist."
    end
  end

  private

   def allowed_params
    params.require(:user).permit(:name, :phoneNum, :password, :password_confirmation, :email,:confirm_email, :confirmation_token)
   end
end
