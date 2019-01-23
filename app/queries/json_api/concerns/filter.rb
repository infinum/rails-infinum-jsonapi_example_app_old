module JsonApi
  module Concerns
    module Filter
      def filters
        filter_keys.map do |filter|
          filter_conditions[filter.to_sym]
        end.compact
      end

      def filter_conditions
        {}
      end

      def where_conditions
        {}
      end

      def filter_keys
        return [] unless params[:filter]
        params[:filter].keys
      end
    end
  end
end
