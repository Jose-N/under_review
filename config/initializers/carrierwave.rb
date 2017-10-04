require 'carrierwave/orm/activerecord'

if !Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                            # required
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],         # required
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],     # required
    }
    config.fog_directory  = ENV['AWS_BUCKET_NAME']                 # required
    config.fog_public     = true                                   # optional, defaults to true
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'files'
    config.permissions = 0777
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
else
  CarrierWave.configure do |config|
    config.storage :file
  end
end
