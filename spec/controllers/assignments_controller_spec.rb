require 'rails_helper'

describe AssignmentsController do
  describe 'POST create' do

    it 'responds successfully' do
      get :create
      expect(response).to be_success
    end
  end
end
