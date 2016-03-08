require 'rails_helper'

RSpec.feature "UserCanSearchProducts", type: :feature do
  scenario "User can use search form on root_path for products" do
    VCR.use_cassette("items#search") do
      visit root_path

      fill_in "Search Criteria", with: "sennheiser"
      click_on("Search")

      items = JSON.parse(response.body)

      expect(current_path).to eq search_path
      expect(page).to have_content("SKU")
      expect(page).to have_content("Name")
      expect(page).to have_content("Customer Average Review")
      expect(page).to have_content("Description")
      expect(page).to have_content("Sale Price")
      expect(page).to have_content("image")
      expect(page).to have_content("sennheiser")
      expect(items).to have(15).things
    end
  end

  scenario "User can use search form on root_path for products with multiple inputs" do
    VCR.use_cassette("items#search_multiple") do
      visit root_path

      fill_in "Search Criteria", with: "sennheiser headphones white"
      click_on("Search")

      items = JSON.parse(response.body)

      expect(current_path).to eq search_path
      expect(page).to have_content("SKU")
      expect(page).to have_content("Name")
      expect(page).to have_content("Customer Average Review")
      expect(page).to have_content("Description")
      expect(page).to have_content("Sale Price")
      expect(page).to have_content("image")
      expect(page).to have_content("sennheiser")
      expect(items).to have(3).things
    end
  end
end
