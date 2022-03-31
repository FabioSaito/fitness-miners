require 'rails_helper'

RSpec.describe 'Exercises', type: :request do
  fixtures :exercises
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
        get new_exercise_path
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns New Exercise in response body' do
        expect(response.body).to include('New Exercise')
      end
    end
  end

  describe 'POST /create' do
    describe 'when not authenticated' do
      before { post exercises_path, params: { exercise: { description: 'Arm Curl', intensity: 4 } } }

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
      end

      it 'returns redirect message in response body' do
        expect(response.body).to include('You are being', 'redirected')
      end
    end
    
    describe 'when authenticated' do
      let(:valid_exercise) { { description: 'Arm Curl', intensity: 4 } }
      let(:invalid_exercise) { { description: '', intensity: 11 } }
      before { sign_in user }

      describe 'when valid exercise' do
        before { post exercises_path, params: { exercise: valid_exercise } }
        it 'creates exercise' do
          expect(Exercise.exists?(description: valid_exercise[:description])).to be true
        end
        
        it 'redirects to home page' do
          expect(response).to redirect_to(root_path)
        end
      end

      describe 'when invalid exercise' do
        before { post exercises_path, params: { exercise: invalid_exercise } }
        it 'does not create exercise' do
          expect(Exercise.exists?(description: invalid_exercise[:description])).to be false
        end

        it 'returns http unprocessable_entity' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
