module EagerLoadRelationships
  def respond_with(resource, options = {})
    resource = includes(resource, params[:include])
    begin
      super(resource, options)
    rescue ActiveRecord::AssociationNotFoundError => error
      raise Networking::AssociationNotFoundError, error
    end
  end

  private

  def includes(collection, include_params)
    return collection unless collection.is_a?(ActiveRecord::Relation)

    collection.includes(include_hash(include_params))
  end

  def include_hash(include_params)
    return {} unless include_params

    include_params.split(',').map(&:strip).map do |relationship|
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
end
