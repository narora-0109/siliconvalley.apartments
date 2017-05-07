require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  #config.fog_provider = 'fog/aws'                           # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'S3_ACCESS_KEY',                        # required
      aws_secret_access_key: 'S3_SECRET_KEY',                        # required
      region:                'S3_REGION',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory = 'S3_BUCKET'                      # required
end

