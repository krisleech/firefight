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
      expect(parse(response).size).to eq(2)
    end

    it 'person contain all expected keys' do
      create_person
      get :index
      expect(parse(response)[0].keys).to eq %w(id first_name last_name full_name)
    end
  end

  describe 'POST create' do
    context 'valid person' do
      let(:valid_json) do
        {
          person: {
            first_name: 'Kris',
            last_name: 'Leech'
          }
        }
      end

      it 'is successful' do
        post :create, valid_json
        expect(response).to be_successful
      end

      it 'saves the person' do
        post :create, valid_json
        expect(PeopleRepo.count).to eq(1)
      end
    end

    context 'invalid person' do
      let(:invalid_json) do
        {
          person: {
            first_name: '',
            last_name: ''
          }
        }
      end

      it 'does not save the person' do
        post :create, invalid_json
        expect(PeopleRepo.count).to eq(0)
      end

      it 'is unsuccessful' do
        post :create, invalid_json
        expect(response).to be_forbidden
      end
    end
  end

  def parse(response)
    JSON.parse(response.body)
  end
end
