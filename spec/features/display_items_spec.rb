require 'rails_helper'

RSpec.feature "DisplayItems", type: :feature do
  scenario "guest can see items" do
    visit root_path

    within('h1') do
      expect(page).to have_content("Items")
    end
  end
end
