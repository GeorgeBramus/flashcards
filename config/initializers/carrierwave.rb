# require 'carrierwave/storage/fog'
# CarrierWave.configure do |config|
# end

# require "fog/aws"
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                          # required
  config.fog_credentials = {
    provider:              'AWS',                          # required
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],       # required
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],   # required
    region:                ENV['REGION']                   # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'fcards'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" } # optional, defaults to {}
  # config.permissions = 0666
  # config.directory_permissions = 0777
  config.storage = :fog
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false
end
