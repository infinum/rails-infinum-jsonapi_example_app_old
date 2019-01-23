module JsonApi
  module Concerns
    module Include
      def include_conditions
        return {} unless params[:include]
        include_keys.map do |relationship|
          include_relationship(relationship)
        end
      end

      def include_relationship(relationship)
        parent, next_relationship = relationship.split('.', 2)

        return include_associations[parent.to_sym].presence || parent unless next_relationship
        { parent => include_relationship(next_relationship) }
      end

      def include_associations
        {}
      end

      def include_keys
        return [] unless params[:include]
        params[:include].split(',').map(&:strip)
      end
    end
  end
end
