# config/initializers/carrierwave.rb
CarrierWave.configure do |config|
	config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWSAccessKeyId'],                        # required
    :aws_secret_access_key  => ENV['AWSSecretKey'],                     # required
    :region                 => 'ap-southeast-1'

    }                  # 

  config.fog_directory  = 'pooptimer'                             # required
 
end