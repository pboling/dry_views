# Copyright (c) 2008-12 Peter H. Boling of 9thBit LLC
# Released under the MIT license
# For Rails 3+
module SanitizeEmail
  class Railtie < ::Rails::Railtie

    config.before_configuration do
      if defined?(Rails)
        if ::Rails::VERSION::MAJOR == 3
          if ::Rails::VERSION::MINOR >= 2
            require 'dry_views/rails3_two'
          elsif
            require 'dry_views/rails3_zero'
          end
        elsif ::Rails::VERSION::MAJOR > 3
          # TODO: Check Rails 4 HEAD to see if the view flow is implemented the same way as 3.2
          require 'dry_views/rails3_two'
        end
      end
    end

  end
end
