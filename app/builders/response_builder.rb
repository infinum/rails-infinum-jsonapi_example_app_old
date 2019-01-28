class ResponseBuilder
  attr_reader :resource, :params

  def initialize(resource, params)
    @resource = resource
    @params = params.permit!.to_h
  end

  def jsonapi_options
    {
      meta: meta,
      links: links,
      fields: fields,
      include: include
    }.compact
  end

  def meta
    return {} unless resource.respond_to?(:current_page)

    {
      current_page: resource.current_page,
      total_pages: resource.total_pages,
      total_count: resource.total_count,
      max_page_size: resource.max_per_page
    }
  end

  def links # rubocop:disable Metrics/AbcSize
    return {} unless resource.respond_to?(:current_page)

    {
      self: build_link(resource.current_page),
      first: build_link(1),
      last: build_link(resource.total_pages),
      prev: build_link(resource.prev_page),
      next: build_link(resource.next_page)
    }.compact
  end

  def include
    params[:include]&.split(',')
  end

  def fields
    return nil unless params[:fields]

    params[:fields].each_with_object({}) do |(model, fields), hash|
      hash[model] = fields.split(',')
    end
  end

  private

  def build_link(page)
    return nil unless page

    params[:page] = {
      number: page,
      size: params.fetch(:page, {}).fetch(:size, Kaminari.config.default_per_page)
    }
    Rails.application.routes.url_helpers.url_for(params)
  end
end
