# Load the rails application
require File.expand_path('../application', __FILE__)

ENV['RAILS_ENV']= 'production'

# Initialize the rails application
Fundidoanegro::Application.initialize!

if ENV['RAILS_ENV'] == 'production'  # don't bother on dev
  ENV['GEM_PATH'] = '/home/gawyn/.gems' #+ ':/usr/lib/ruby/gems/1.8'  # Need this or Passenger fails to start
end

