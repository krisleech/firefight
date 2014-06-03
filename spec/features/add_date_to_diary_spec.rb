require 'rails_helper'

describe 'adding date to diary' do
  before do
    # add person
  end

  it 'adds date to diary' do
    visit '/'

    within('#new_assignment') do
      fill_in 'Date', with: '20/05/2014'
      fill_in 'Person', with: 'Kris Leech'
      fill_in 'Days', with: '2'
    end

    click_link 'Save'
    expect(page).to have_content 'Assignment saved.'
  end
end
