require 'rails_helper'

RSpec.describe 'Routines', type: :request do
  fixtures :routines
  let(:user) { User.create!(email: 'rspec@devise.com', password: '123123') }

  describe 'GET /new' do
    describe 'when not authenticated' do 
      before { get new_exercise_path }

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
      end

      it 'returns redirect message in response body' do
        expect(response.body).to include('You are being', 'redirected')
      end
    end

    describe 'when authenticated' do 
      before do
        sign_in user
        get new_routine_path
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns New Routine in response body' do
        expect(response.body).to include('New Routine')
      end
    end
  end

  describe 'POST /create' do
    describe 'when not authenticated' do
      before { post routines_path, params: { routine: { name: 'Monday' } } }

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
      end

      it 'returns redirect message in response body' do
        expect(response.body).to include('You are being', 'redirected')
      end
    end

    describe 'when authenticated' do
      before do
        sign_in user
        post routines_path, params: { routine: { name: 'Monday' } }
      end

      it 'creates routine' do
        expect(Routine.exists?(name: 'Monday')).to be true
      end
      
      it 'redirects to home page' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
