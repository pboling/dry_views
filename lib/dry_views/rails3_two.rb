module ActionView
  module Helpers
    module CaptureHelper

      # Reference: http://api.rubyonrails.org/classes/ActionView/Helpers/CaptureHelper.html
      #
      # Custom method (not overriding anything in Rails)
      #
      # In a template/layout
      #
      #  = content_for_with_default :my_default_content, :partial => 'layouts/my_default_content'
      #
      # Override in a nested layout/template/partial:
      #
      #  = content_for :my_default_content do
      #    = render :partial => 'layouts/my_custom_content', :collection => my_stuff, :as => :stuff
      #
      # All params after the first will be used as options for the default render
      #
      #  = content_for_with_default :my_default_content, :partial => 'some/partial', :locals => {:variable => 'Some Text'}
      #
      def content_for_with_default(name, *args, &block)
        if content_check = content_for?(name) # returns true, false, or :empty
          content_for_without_empty_check(name) unless content_check == :empty # when content_check is :empty, does nothing
        elsif block_given?
          content_for_without_empty_check(name, yield) # No need to recheck for empty here, as initial condition handles the :empty case
        else
          options = args.extract_options!
          # Supports the default API of with content as the second param, content_for(name, content = nil, &block)
          if options.empty?
            content_for_without_empty_check(name, args.first) # No need to recheck for empty here, as initial condition handles the :empty case
          else
            render options
          end
        end
      end

      # Override file actionpack/lib/action_view/helpers/capture_helper.rb, line 136
      # If the empty check has already been performed (as content_for_with_default), you can call content_for_without_empty_check to bypass a duplicate check
      def content_for_with_empty_check(name, content = nil, &block)
        if content_for?(name) == :empty
          # Some preceding layout or template has already specified that there is to be no content for this name, and that is FINAL.
          return nil
        else
          content_for_without_empty_check(name, content, &block)
        end
      end
      alias_method_chain :content_for, :empty_check

      # Override file actionpack/lib/action_view/helpers/capture_helper.rb, line 175
      def content_for_with_empty_check?(name)
        if @view_flow.get(name) == DryViews::EMPTY_CONTENT
          #add a check for empty, and return :empty, so we can switch on it for empty content
          return :empty
        elsif content_for_without_empty_check?(name)
          return true
        else
          return false
        end
      end
      alias_method_chain :content_for?, :empty_check

      # Custom method (not overriding anything in Rails)
      def no_content_for(name)
        @view_flow.append!(name, DryViews::EMPTY_CONTENT)
      end

    end
  end
end
