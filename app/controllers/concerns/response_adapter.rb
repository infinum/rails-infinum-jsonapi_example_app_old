module ResponseAdapter
  extend ActiveSupport::Concern

  SORT_ORDERS = { '-' => :asc, '+' => :desc }.freeze

  def included_relationships
    return params[:include] if params[:include]

    relationships_for_method
  end

  def fields
    return nil unless params[:fields]

    params[:fields].to_unsafe_hash.each_with_object({}) do |(model, fields), hash|
      hash[model] = fields.split(',')
    end
  end

  private

  def relationships_for_method
    if action_name == 'show'
      default_included_relationships
    else
      []
    end
  end

  def default_included_relationships
    raise 'no default_included_relationships defined in controller'
  end
end
