require 'rails_helper'

feature 'diary' do
  background { person }
  given(:person) { build_person }

  scenario 'assigning person to date' do
    visit diary_path

    within('#new_assignment') do
      fill_in 'Date', with: '20/05/2014'
      select person.full_name, from: 'Person'
      fill_in 'Days', with: '2'
    end

    click_button 'Assign'
    expect(page).to have_content 'Assignment saved.'
  end
end
