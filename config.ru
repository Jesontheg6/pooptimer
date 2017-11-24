# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

require ::File.expand_path('../config/environment',  __FILE__)
use Rack::Static, :urls => ['/carrierwave'], :root => 'tmp' # adding this line
run Pooptimer::Application

# config/initializers/carrierwave.rb
CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'key',                        # required
    :aws_secret_access_key  => 'secret',                     # required
    :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
    :host                   => 's3.example.com',             # optional, defaults to nil
    :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'directory'                             # required
 
end


run Rails.application


