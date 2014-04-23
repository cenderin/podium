require 'base_spec_helper'
require 'responsive_service'
Dir[File.join(RAILS_ROOT, 'spec/support_services/**/*.rb')].each { |f| require f }
ActiveSupport::Dependencies.autoload_paths << "#{RAILS_ROOT}/app/services"
