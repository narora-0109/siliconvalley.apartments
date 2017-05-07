class Picture < ApplicationRecord
  mount_uploader :picture_json, PictureUploader
  belongs_to :listing




end

