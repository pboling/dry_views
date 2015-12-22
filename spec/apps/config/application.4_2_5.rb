require "rails"
require "active_support"
require "active_support/railtie"

require "dry_views" # this gem

module Rails_4_2_5
  class Application < Rails::Application
    # When running commands from the spec/apps directory we can't override
    #   Rails root like this or it would be spec/apps/spec/apps
    config.root = File.join(Rails.root, "spec/apps") unless ENV["SKIP_RAILS_ROOT_OVERRIDE"]

    config.cache_classes = true

    config.autoload_paths += Dir["#{Rails.root}/app/controllers/*"]

    config.eager_load = false
    config.serve_static_files  = true
    config.static_cache_control = "public, max-age=3600"

    config.consider_all_requests_local       = true

    config.action_dispatch.show_exceptions = false

    config.active_support.deprecation = :stderr

    config.middleware.delete "Rack::Lock"
    config.middleware.delete "ActionDispatch::Flash"
    config.middleware.delete "ActionDispatch::BestStandardsSupport"
    config.secret_key_base = "49837489qkuweoiuoqwehisuakshdjksadhaisdy78o34y138974xyqp9rmye8yrpiokeuioqwzyoiuxftoyqiuxrhm3iou1hrzmjk"
    routes.append do
      get "/" => "welcome#index"

      # This is a legacy wild controller route that's not recommended for RESTful applications.
      # Note: This route will make all actions in every controller accessible via GET requests.
      get ":controller(/:action(/:id))(.:format)"
    end
  end
end

Rails_4_2_5::Application.initialize!
