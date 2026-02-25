require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe 'GET /login' do
    it 'ログインフォームを表示する' do
      get login_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Login')
    end
  end

  describe 'POST /sessions' do
    let!(:user) { create(:user, password: 'password', password_confirmation: 'password') }

    context '認証に成功した場合' do
      it 'events にリダイレクトし、ログアウトリンクが表示される（= セッションが張られる）' do
        post sessions_path, params: { email: user.email, password: 'password' }

        expect(response).to redirect_to(events_path)

        follow_redirect!

        expect(response).to have_http_status(:ok)
        expect(response.body).to include('ログインに成功しました')
        expect(response.body).to include('ログアウト')
      end
    end

    context '認証に失敗した場合' do
      it '401 を返し、同じ画面にエラーメッセージを表示する' do
        post sessions_path, params: { email: user.email, password: 'wrong' }

        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to include('ログインに失敗しました')
        expect(response.body).to include('Login')
      end
    end
  end

  describe 'DELETE /sessions/:id' do
    let!(:user) { create(:user, password: 'password', password_confirmation: 'password') }

    it 'ログアウトして login にリダイレクトし、ログインリンクが表示される' do
      post sessions_path, params: { email: user.email, password: 'password' }
      expect(response).to redirect_to(events_path)

      delete session_path(user)
      expect(response).to redirect_to(login_path)

      follow_redirect!

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Login')
      expect(response.body).to include('ログイン')
      expect(response.body).not_to include('ログアウト')
    end
  end
end
