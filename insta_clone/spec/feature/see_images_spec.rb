require 'rails_helper'

feature "Photos" do

  context "haven't been added" do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_button 'Add'
    end
  end

  context 'have been added' do

    before do
      Photo.create(url: '', placeholder: 'A photo')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('A photo')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'adding photos' do
  scenario 'prompts user to fill out a form, then displays the new photo' do
    visit '/photos'
    click_button 'Add'
    fill_in 'photo[placeholder]', with: 'A photo'
    click_button 'Create Photo'
    expect(page).to have_content 'A photo'
    expect(current_path).to eq '/photos'
  end
end
end
