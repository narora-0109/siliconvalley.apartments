class ListingsController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:create, :update]
  before_action :authorize, except: [:show, :index]

  def index

  end

  def show
    @listings = Listing.by_city(params[:city].downcase).by_state(params[:state].downcase).by_bathroom(params[:bathrooms]).by_price(params[:min_price], params[:max_price]).by_bedrooms(params[:bedrooms]).by_pets(params[:pets].downcase)
    render :json => @listings.as_json
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = session[:id]
      if @listing.save
        params[:listing]['pictures'].each do |file|
          @listing.pictures.create!(:picture_json => file)
        end
          flash[:notice] = "Listing added successfully!"
          render :create
      else
        flash[:notice] = "Error creating Listing!"
        render :new
      end
  end

  def delete
    #TODO - check that listing belongs to loggedin user before deleting it
    if Listing.find(params[:id]).destroy
      flash[:notice] = "Listing deleted successfully!"
      redirect_to '/users'
    else
      flash[:notice] = "Error deleting listing!"
    end
  end

  def update
    if (params[:id].present?)
      @listing = Listing.left_outer_joins(:pictures).where(:id => params[:id])
    else
      @listing = Listing.find_by(id: params[:listing][:id])
      if @listing.update_attributes(listing_params)
        redirect_to '/users'
      else
        render 'update'
      end
    end
  end


  private

  def listing_params
    params.require(:listing).permit(:unit_num,:streetnum,:streetname,:city,:state,:country,:zipcode,:price,:latitude,:longitude,:property_desc,:property_type, :sq_ft,:bedrooms, :bathrooms, :pets,:leasing_fees)
  end

end
