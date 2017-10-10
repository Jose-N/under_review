require 'carrierwave/orm/activerecord'

if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage :file
  end
else
  CarrierWave.configure do |config|

    config.storage = :aws
    config.aws_bucket = ENV.fetch('AWS_BUCKET')
    config.aws_acl    = 'public-read'

    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

    config.aws_credentials = {
      access_key_id:     ENV.fetch('AWS_ID'),
      secret_access_key: ENV.fetch('AWS_KEY'),
      region:            ENV.fetch('AWS_REGION') # Required
    }

  end
end
