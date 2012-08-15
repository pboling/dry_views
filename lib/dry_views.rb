require "dry_views/version"

module DryViews

  EMPTY_CONTENT = ' ' # For Rails 3.0+ only works with ' '.
                      # nil, false, :empty, cannot work, because @view_flow.get(name) is always converted to an
                      # ActiveSupport::SafeBuffer (a fancy string)

  require 'dry_views/railtie'


end
