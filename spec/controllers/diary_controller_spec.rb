require 'rails_helper'

describe DiaryController do
  describe 'GET show' do

    it 'responds successfully' do
      get :show
      expect(response).to be_success
    end
  end
end
