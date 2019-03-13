describe 'Create movie' do
  include Docs::Api::V1::Movies::Api
  let(:params) { json_api_params(movie_attributes) }
  let(:user) { create(:admin) }
  let(:create_movie) { post '/api/v1/movies', params: params, headers: authenticated_headers(user) }

  context 'when params are valid' do
    include Docs::Api::V1::Movies::Create
    let(:genre) { create(:genre) }
    let(:director) { create(:director) }
    let(:movie_attributes) do
      attributes_for(:movie)
        .merge(type: :movies)
        .merge(
          relationships: {
            genres: { data: [{ id: genre.id, type: :genres }] },
            director: { data: { id: director.id, type: :directors } }
          }
        )
    end

    it 'returns 201 status', :dox do
      create_movie
      expect(response).to have_http_status(:created)
    end

    context 'when user is not admin' do
      let(:user) { create(:user) }

      it 'returns 403 status', :dox do
        create_movie
        expect(response).to have_http_status(:forbidden)
      end
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
