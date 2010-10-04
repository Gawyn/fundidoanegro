# Load the rails application
ENV['RAILS_ENV']= 'production'

if ENV['RAILS_ENV'] == 'production'  # don't bother on dev
  ENV['GEM_PATH'] = '/home/gawyn/.gems' + ':/usr/lib/ruby/gems/1.8'
end

require File.expand_path('../application', __FILE__)



# Initialize the rails application
Fundidoanegro::Application.initialize!


