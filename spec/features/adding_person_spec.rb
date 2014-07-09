require 'rails_helper'

feature 'adding person' do

  pending 'adding multiple people' do
    visit diary_path

    within('#add_person') do
      fill_in 'First name', with: 'Kris'
      fill_in 'Last name', with: 'Leech'
    end

    click_button 'Save'

    expect(page).to have_content 'Person Saved.' # page contains json response!?!
    expect(page).to have_content 'Kris Leech'
  end
end

