describe 'Create movie' do
  include Docs::Api::V1::Movies::Api
  let(:params) { json_api_params(movie_attributes) }
  let(:create_movie) { post 'api/v1/movies', params: params, headers: default_headers }

  context 'when params are valid' do
    include Docs::Api::V1::Movies::Create
    let(:genre) { create(:genre) }
    let(:movie_attributes) do
      attributes_for(:movie)
        .merge(type: :movies)
        .merge(relationships: { genres: { data: [{ id: genre.id, type: :genres }] } })
    end

    it 'returns 201 status', :dox do
      create_movie
      expect(response).to have_http_status(:created)
    end
  end

  context 'when params are not valid' do
    include Docs::Api::V1::Movies::Create
    let(:movie_attributes) { attributes_for(:movie, title: nil).merge(type: :movies) }

    it 'returns 422 status', :dox do
      create_movie
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
