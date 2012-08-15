# See dry_views/rails2_two for comments... this is the same logic applied to the older ActionView @_content_for chain

module ActionView
  module Helpers
    module CaptureHelper

      def content_for_with_default(name, *args, &block)
        if content_check = content_for?(name)
          content_for_without_empty_check(name) unless content_check == :empty
        elsif block_given?
          content_for_without_empty_check(name, yield)
        else
          options = args.extract_options!
          if options.empty?
            content_for_without_empty_check(name, args.first)
          else
            render options
          end
        end
      end

      def content_for_with_empty_check(name, content = nil, &block)
        if content_for?(name) == :empty
          return nil
        else
          content_for_without_empty_check(name, content, &block)
        end
      end
      alias_method_chain :content_for, :empty_check

      def content_for_with_empty_check?(name)
        if @_content_for[name] == DryViews::EMPTY_CONTENT
          return :empty
        elsif content_for_without_empty_check?(name)
          return true
        else
          return false
        end
      end
      alias_method_chain :content_for?, :empty_check

      def no_content_for(name)
        @_content_for[name] << DryViews::EMPTY_CONTENT
      end

    end
  end
end
