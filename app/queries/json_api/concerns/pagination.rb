module JsonApi
  module Concerns
    module Pagination
      def page_number
        params.fetch(:page, {}).fetch(:number, 1)
      end

      def page_size
        params.fetch(:page, {}).fetch(:size, Kaminari.config.default_per_page)
      end
    end
  end
end
