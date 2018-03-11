require 'rails_helper'

RSpec.feature 'Checksums', type: :feature do
  let(:input) { 'The quick brown fox jumps over the lazy dog' }
  let(:checksum) { '9-4-3-24-43' }

  scenario 'user generates a checksum' do
    visit '/checksums/new'
    fill_in 'Text', with: input
    click_button 'Create Checksum'

    expect(page).to have_text("The generated checksum: #{checksum}")
  end

  scenario 'user submits empty form' do
    visit 'checksums/new'
    click_button 'Create Checksum'

    expect(page).to have_current_path(new_checksums_path)
    expect(page).to have_text('Input text is required')
  end
end
