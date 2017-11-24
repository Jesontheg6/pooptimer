# config/initializers/carrierwave.rb
CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'ENV['S3_KEY']',                        # required
    :aws_secret_access_key  => 'ENV['S3_SECRET_KEY']',                     # required
    :region                 => 'ap-southeast-1',                  # 

  config.fog_directory  = 'pooptimer'                             # required
 
end