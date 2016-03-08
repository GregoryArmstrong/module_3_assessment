require 'rails_helper'

RSpec.feature "UserCanSearchProducts", type: :feature do
  scenario "User can use search form on root_path for products" do
    visit root_path

    fill_in "Search Criteria", with: "sennheiser"
    click_on("Search")

    expect(current_path).to eq search_path
    expect(page).to have_content("")

  end
end
