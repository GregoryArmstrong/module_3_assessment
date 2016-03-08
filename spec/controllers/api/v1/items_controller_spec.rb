require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  scenario "GET Api::V1::Items#Index" do
    get :index, format: :json

    expect(response.status).to eq(200)
    expect(response.content_type).to eq "application/json"

    items = JSON.parse(response.body)

    expect(items).to have_content("name")
    expect(items).to have_content("description")
    expect(items).to have_content("image_url")
  end
end
