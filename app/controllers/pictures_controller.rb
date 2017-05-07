class PicturesController < ApplicationController

  before_action :authorize
  before_action :set_listing, except: [:destroy]

  def create
    add_more_pictures(pictures_params[:pictures])
    flash[:error] = "Failed uploading images" unless @listing.save
    redirect_to :back
  end

  def destroy
      remove_picture_at_index(params[:id].to_i)
      #flash[:error] = "Failed deleting image" unless
      redirect_to '/users'
  end

  private

  def remove_picture_at_index(index)
    remain_images = Picture.where(:id => params[:id]) # copy the array
    deleted_image = remain_images.destroy(index) # delete the target image
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def add_more_pictures(new_pictures)
    pictures = @listing.pictures # copy the old images
    pictures += new_pictures # concat old images with new ones
    @listing.pictures = pictures # assign back
  end

  def pictures_params
    params.require(:listing).permit({pictures: []}) # allow nested params as array
  end
end
