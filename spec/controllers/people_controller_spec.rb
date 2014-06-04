require 'rails_helper'

describe PeopleController do
  describe 'GET index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_success
    end

    it 'responds with all people' do
      2.times { create_person }
      get :index
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST create' do
    context 'valid person' do
      let(:valid_json) do
        {
          first_name: 'Kris',
          last_name: 'Leech'
        }
      end

      it 'saves the person' do
        post :create, :json => valid_json
        expect(PeopleRepo.count).to eq(1)
      end
    end

    context 'invalid person' do
      let(:valid_json) do
        {
          first_name: '',
          last_name: ''
        }
      end

      it 'does not save the person' do
        post :create, :json => valid_json
        expect(PeopleRepo.count).to eq(0)
      end

      it 'is unsuccessful' do
        post :create, :json => valid_json
        expect(response.code).to eq(500)
      end
    end
  end
end
