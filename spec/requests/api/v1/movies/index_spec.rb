describe 'List movies' do
  include Docs::Api::V1::Movies::Api
  let(:get_movies) { get 'api/v1/movies', params: params, headers: headers }
  let(:user) { create(:user) }
  let(:params) { {} }

  before do
    create_list(:movie, 3)
  end

  context 'when a user is logged in' do
    include Docs::Api::V1::Movies::Index
    let(:headers) { authenticated_headers(user) }

    it 'returns 200 status' do
      get_movies
      expect(response).to have_http_status(:ok)
    end

    it 'returns movies', :dox do
      get_movies
      expect(response_array.size).to eq 3
    end

    context 'with ordering' do
      include Docs::Api::V1::Movies::Index
      let(:star_wars_1) { create(:movie, title: 'Star Wars 1') }
      let(:star_wars_2) { create(:movie, title: 'Star Wars 2') }
      let(:params) { { sort: '-title' } }

      before do
        Movie.delete_all
        star_wars_1
        star_wars_2
      end

      it 'returns movies sorted by title', :dox do
        get_movies
        expect(response_array.pluck('id')).to eq [star_wars_2.id.to_s, star_wars_1.id.to_s]
      end
    end

    context 'with relationship inclusion' do
      include Docs::Api::V1::Movies::Index
      let(:movie) { create(:movie) }
      let(:params) { { include: 'genres' } }

      before do
        movie.genres << create(:genre)
      end

      it 'returns movies with included relationships', :dox do
        get_movies
        expect(json_response['included'].map { |i| i['type'] }).to eq ['genres']
      end
    end

    context 'with fields inclusion' do
      include Docs::Api::V1::Movies::Index
      let(:params) { { fields: { movies: 'title,runtime' } } }

      it 'returns movies with only the included fields', :dox do
        get_movies
        expect(response_array.first.dig('attributes').keys.size).to eq 2
      end
    end
  end

  context 'when a user is not logged in' do
    include Docs::Api::V1::Movies::Index
    let(:headers) { default_headers }

    it 'returns 200 when user is not logged in' do
      get_movies
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when application/json content-type sent' do
    include Docs::Api::V1::Movies::Index
    let(:headers) { { 'content-type' => 'application/json', 'accept' => 'application/json' } }

    it 'returns 406 when bad content-type sent', :dox do
      get_movies
      expect(response).to have_http_status(:not_acceptable)
    end
  end

  context 'when no content-type sent' do
    include Docs::Api::V1::Movies::Index
    let(:headers) { {} }

    it 'returns 406 when no content-type sent', :dox do
      get_movies
      expect(response).to have_http_status(:not_acceptable)
    end
  end
end
