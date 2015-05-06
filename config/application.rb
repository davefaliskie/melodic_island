require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



module MelodicIsland
  class Application < Rails::Application
    
    AWS::S3::Base.establish_connection!(
        :access_key_id     => 'AKIAIDKINQPV2O4S4OCA',
        :secret_access_key => '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'
    )

    BUCKET = 'melodicisland'

  end
end
