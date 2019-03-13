describe 'Logout' do
  include Docs::Api::V1::Sessions::Api
  let(:user) { create(:user) }

  context 'When login is valid for an existing user' do
    include Docs::Api::V1::Sessions::Delete

    let(:logout_user) { delete '/api/v1/sessions', headers: authenticated_headers(user) }

    it 'returns 204 status' do
      logout_user
      expect(response).to have_http_status(:no_content)
    end

    it 'changes users jti_claim after logout', :dox do
      expect { logout_user }.to change { user.reload.jti_claims.size }
    end
  end

  context 'When user not logged in' do
    include Docs::Api::V1::Sessions::Delete

    before { delete '/api/v1/sessions', headers: default_headers }

    it 'returns 401 status when user not logged in', :dox do
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
